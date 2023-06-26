/obj/machinery/rnd/production
	name = "technology fabricator"
	desc = "Makes researched and prototype items with materials and energy."
	layer = BELOW_OBJ_LAYER

	/// The efficiency coefficient. Material costs and print times are multiplied by this number;
	/// better parts result in a higher efficiency (and lower value).
	var/efficiency_coeff = 1
	
	/// What designs it can print from a department
	var/allowed_department_flags = ALL

	/// Animation when an item is printed
	var/production_animation

	/// What designs it can print from a "machine" eg PROTOLATHE | AUTOLATHE | MECHFAB
	var/allowed_buildtypes = NONE

	/// The department this fabricator is assigned to.
	var/department_tag = "Unassigned"

	/// All designs in the techweb that can be fabricated by this machine, since the last update.
	var/list/datum/design/cached_designs

	/// The material storage used by this fabricator.
	var/datum/component/remote_materials/materials

/obj/machinery/rnd/production/Initialize(mapload)
	. = ..()

	cached_designs = list()
	materials = AddComponent(/datum/component/remote_materials, "lathe", mapload)

	create_reagents(0, OPENCONTAINER)
	update_designs()
	RefreshParts()

	RegisterSignal(
		stored_research,
		list(COMSIG_TECHWEB_ADD_DESIGN, COMSIG_TECHWEB_REMOVE_DESIGN),
		.proc/on_techweb_update
	)

/obj/machinery/rnd/production/Destroy()
	materials = null
	cached_designs = null
	matching_designs = null
	return ..()

/obj/machinery/rnd/production/proc/on_techweb_update()
	SIGNAL_HANDLER

	// We're probably going to get more than one update (design) at a time, so batch
	// them together.
	addtimer(CALLBACK(src, .proc/update_designs), 2 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)

/// Updates the list of designs this fabricator can print.
/obj/machinery/rnd/production/proc/update_designs()
	var/previous_design_count = cached_designs.len

	cached_designs.Cut()

	for(var/design_id in stored_research.researched_designs)
		var/datum/design/design = SSresearch.techweb_design_by_id(design_id)

		if((isnull(allowed_department_flags) || (design.departmental_flags & allowed_department_flags)) && (design.build_type & allowed_buildtypes))
			cached_designs |= design

	var/design_delta = cached_designs.len - previous_design_count

	if(design_delta > 0)
		say("Received [design_delta] new design[design_delta == 1 ? "" : "s"].")
		playsound(src, 'sound/machines/twobeep_high.ogg', 50, TRUE)

	update_static_data_for_all_viewers()

/obj/machinery/rnd/production/RefreshParts()
	calculate_efficiency()
	update_static_data(usr)

/obj/machinery/rnd/production/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/spritesheet/sheetmaterials),
		get_asset_datum(/datum/asset/spritesheet/research_designs)
	)

/obj/machinery/rnd/production/ui_interact(mob/user, datum/tgui/ui)
	user.set_machine(src)

	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Fabricator")
		ui.open()

/obj/machinery/rnd/production/ui_static_data(mob/user)
	var/list/data = list()
	var/list/designs = list()

	var/datum/asset/spritesheet/research_designs/spritesheet = get_asset_datum(/datum/asset/spritesheet/research_designs)
	var/size32x32 = "[spritesheet.name]32x32"

	for(var/datum/design/design in cached_designs)
		var/cost = list()

		for(var/datum/material/material in design.materials)
			var/coefficient = efficient_with(design.build_path) ? efficiency_coeff : 1
			cost[material.name] = design.materials[material] * coefficient

		var/icon_size = spritesheet.icon_size_id(design.id)

		designs[design.id] = list(
			"name" = design.name,
			"desc" = design.get_description(),
			"cost" = cost,
			"id" = design.id,
			"categories" = design.category,
			"icon" = "[icon_size == size32x32 ? "" : "[icon_size] "][design.id]",
			"constructionTime" = 0
		)

	data["designs"] = designs
	data["fabName"] = name

	return data

/obj/machinery/rnd/production/ui_data(mob/user)
	var/list/data = list()

	data["materials"] = materials.mat_container?.ui_data()
	data["onHold"] = materials.on_hold()
	data["busy"] = busy

	return data

/obj/machinery/rnd/production/ui_act(action, list/params)
	. = ..()

	if(.)
		return

	. = TRUE

	switch (action)
		if("remove_mat")
			var/datum/material/material = locate(params["ref"])
			eject_sheets(material, params["amount"])

		if("sync_rnd")
			update_designs()

		if("build")
			user_try_print_id(params["ref"], params["amount"])

/obj/machinery/rnd/production/proc/calculate_efficiency()
	efficiency_coeff = 1

	if(reagents)		//If reagents/materials aren't initialized, don't bother, we'll be doing this again after reagents init anyways.
		reagents.maximum_volume = 0
		for(var/obj/item/reagent_containers/glass/beaker in component_parts)
			reagents.maximum_volume += beaker.volume
			beaker.reagents.trans_to(src, beaker.reagents.total_volume)

	if(materials)
		var/total_storage = 0

		for(var/obj/item/stock_parts/matter_bin/bin in component_parts)
			total_storage += bin.rating * 75000

		materials.set_local_size(total_storage)

	var/total_rating = 1.2
	for(var/obj/item/stock_parts/manipulator/manipulator in component_parts)
		total_rating -= manipulator.rating * 0.1

	efficiency_coeff = max(total_rating, 0)

//we eject the materials upon deconstruction.
/obj/machinery/rnd/production/on_deconstruction()
	for(var/obj/item/reagent_containers/glass/G in component_parts)
		reagents.trans_to(G, G.reagents.maximum_volume)

	return ..()

/obj/machinery/rnd/production/proc/do_print(path, amount, list/matlist, notify_admins)
	if(notify_admins)
		investigate_log("[key_name(usr)] built [amount] of [path] at [src]([type]).", INVESTIGATE_RESEARCH)
		message_admins("[ADMIN_LOOKUPFLW(usr)] has built [amount] of [path] at \a [src]([type]).")

	for(var/i in 1 to amount)
		var/obj/item/I = new path(get_turf(src))
		if(efficient_with(I.type))
			I.materials = matlist.Copy()
	SSblackbox.record_feedback("nested tally", "item_printed", amount, list("[type]", "[path]"))

/obj/machinery/rnd/production/proc/check_mat(datum/design/being_built, var/mat)	// now returns how many times the item can be built with the material
	if (!materials.mat_container)  // no connected silo
		return 0
	var/list/all_materials = being_built.reagents_list + being_built.materials

	var/A = materials.mat_container.get_material_amount(mat)
	if(!A)
		A = reagents.get_reagent_amount(mat)

	// these types don't have their .materials set in do_print, so don't allow
	// them to be constructed efficiently
	var/ef = efficient_with(being_built.build_path) ? efficiency_coeff : 1
	return round(A / max(1, all_materials[mat] / ef))

/obj/machinery/rnd/production/proc/efficient_with(path)
	return !ispath(path, /obj/item/stack/sheet) && !ispath(path, /obj/item/stack/ore/bluespace_crystal)

/obj/machinery/rnd/production/proc/user_try_print_id(design_id, print_quantity)
	if(!design_id)
		return FALSE

	if(istext(print_quantity))
		print_quantity = text2num(print_quantity)

	if(isnull(print_quantity))
		print_quantity = 1

	var/datum/design/design = stored_research.researched_designs[design_id] ? SSresearch.techweb_design_by_id(design_id) : null

	if(!istype(design))
		return FALSE

	if(!(isnull(allowed_department_flags) || (design.departmental_flags & allowed_department_flags)))
		say("Warning: Printing failed: This fabricator does not have the necessary keys to decrypt design schematics. Please update the research data with the on-screen button and contact Nanotrasen Support!")
		return FALSE

	if(design.build_type && !(design.build_type & allowed_buildtypes))
		say("This machine does not have the necessary manipulation systems for this design. Please contact Nanotrasen Support!")
		return FALSE
		
	if(!materials.mat_container)
		say("No connection to material storage, please contact the quartermaster.")
		return FALSE

	if(materials.on_hold())
		say("Mineral access is on hold, please contact the quartermaster.")
		return FALSE

	var/power = 1000
	print_quantity = clamp(print_quantity, 1, 50)
	
	for(var/material in design.materials)
		power += round(design.materials[material] * print_quantity / 35)

	power = min(3000, power)
	use_power(power)

	var/coefficient = efficient_with(design.build_path) ? efficiency_coeff : 1
	var/list/efficient_mats = list()

	for(var/material in design.materials)
		efficient_mats[material] = design.materials[material] * coefficient

	if(!materials.mat_container.has_materials(efficient_mats, print_quantity))
		say("Not enough materials to complete prototype[print_quantity > 1 ? "s" : ""].")
		return FALSE

	for(var/reagent in design.reagents_list)
		if(!reagents.has_reagent(reagent, design.reagents_list[reagent] * print_quantity * coefficient))
			say("Not enough reagents to complete prototype[print_quantity > 1 ? "s" : ""].")
			return FALSE

	materials.mat_container.use_materials(efficient_mats, print_quantity)
	materials.silo_log(src, "built", -print_quantity, "[design.name]", efficient_mats)

	for(var/reagent in design.reagents_list)
		reagents.remove_reagent(reagent, design.reagents_list[reagent] * print_quantity * coefficient)

	busy = TRUE
	if(production_animation)
		flick(production_animation, src)

	var/timecoeff = design.lathe_time_factor / efficiency_coeff
	to_chat(world, "Time coeff: [timecoeff]")
	addtimer(CALLBACK(src, PROC_REF(reset_busy)), (30 * timecoeff * print_quantity) ** 0.5)
	addtimer(CALLBACK(src, PROC_REF(do_print), design.build_path, print_quantity, efficient_mats, design.dangerous_construction), (32 * timecoeff * print_quantity) ** 0.8)
	return TRUE

/obj/machinery/rnd/production/proc/eject_sheets(eject_sheet, eject_amt)
	var/datum/component/material_container/mat_container = materials.mat_container

	if (!mat_container)
		say("No access to material storage, please contact the quartermaster.")
		return 0

	if (materials.on_hold())
		say("Mineral access is on hold, please contact the quartermaster.")
		return 0

	var/count = mat_container.retrieve_sheets(text2num(eject_amt), eject_sheet, drop_location())

	var/list/matlist = list()
	matlist[eject_sheet] = MINERAL_MATERIAL_AMOUNT
	
	materials.silo_log(src, "ejected", -count, "sheets", matlist)
	return count
