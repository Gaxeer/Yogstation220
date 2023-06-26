/obj/machinery/mecha_part_fabricator
	icon = 'icons/obj/robotics.dmi'
	icon_state = "fab-idle"
	name = "exosuit fabricator"
	desc = "Nothing is being built."
	density = TRUE

	req_access = list(ACCESS_ROBO_CONTROL)
	circuit = /obj/item/circuitboard/machine/mechfab

	use_power = IDLE_POWER_USE
	idle_power_usage = 20
	active_power_usage = 5000

	subsystem_type = /datum/controller/subsystem/processing/fastprocess

	///Whether the access is hacked or not
	var/hacked = FALSE

	///World ticks the machine is electified for
	var/seconds_electrified = MACHINE_NOT_ELECTRIFIED

	/// Controls whether or not the more dangerous designs have been unlocked by a head's id manually, rather than alert level unlocks
	var/authorization_override = FALSE

	/// Current items in the build queue.
	var/list/datum/design/queue

	/// Whether or not the machine is building the entire queue automagically.
	var/process_queue = FALSE

	/// The current design datum that the machine is building.
	var/datum/design/being_built

	/// World time when the build will finish.
	var/build_finish = 0

	/// World time when the build started.
	var/build_start = 0

	/// Reference to all materials used in the creation of the item being_built.
	var/list/build_materials

	/// Part currently stored in the Exofab.
	var/obj/item/stored_part

	/// Coefficient for the speed of item building. Based on the installed parts.
	var/time_coeff = 1

	/// Coefficient for the efficiency of material usage in item building. Based on the installed parts.
	var/component_coeff = 1

	/// Reference to the techweb.
	var/datum/techweb/stored_research

	/// Whether the Exofab links to the ore silo on init. Special derelict or maintanance variants should set this to FALSE.
	var/link_on_init = TRUE

	/// Reference to a remote material inventory, such as an ore silo.
	var/datum/component/remote_materials/rmat

	/// All designs in the techweb that can be fabricated by this machine, since the last update.
	var/list/datum/design/cached_designs

/obj/machinery/mecha_part_fabricator/Initialize(mapload)
	queue = list()
	stored_research = SSresearch.science_tech
	rmat = AddComponent(/datum/component/remote_materials, "mechfab", mapload && link_on_init)
	RefreshParts() //Recalculating local material sizes if the fab isn't linked
	wires = new /datum/wires/mecha_part_fabricator(src)
	RegisterSignal(
		stored_research,
		list(COMSIG_TECHWEB_ADD_DESIGN, COMSIG_TECHWEB_REMOVE_DESIGN),
		.proc/on_techweb_update
	)
	return ..()

/obj/machinery/mecha_part_fabricator/Destroy()
	QDEL_NULL(wires)
	return ..()

/obj/machinery/mecha_part_fabricator/proc/on_techweb_update()
	SIGNAL_HANDLER

	// We're probably going to get more than one update (design) at a time, so batch
	// them together.
	addtimer(CALLBACK(src, .proc/update_menu_tech), 2 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)

/**
 * Updates the `final_sets` and `buildable_parts` for the current mecha fabricator.
 */
/obj/machinery/mecha_part_fabricator/proc/update_menu_tech()
	if (!islist(cached_designs))
		cached_designs = list()

	var/previous_design_count = cached_designs.len

	cached_designs.Cut()

	for(var/design_id in stored_research.researched_designs)
		var/datum/design/design = SSresearch.techweb_design_by_id(design_id)

		if(design?.build_type & MECHFAB)
			cached_designs |= design

	var/design_delta = cached_designs.len - previous_design_count

	if(design_delta > 0)
		say("Received [design_delta] new design[design_delta == 1 ? "" : "s"].")
		playsound(src, 'sound/machines/twobeep_high.ogg', 50, TRUE)

	update_static_data_for_all_viewers()
	
/obj/machinery/mecha_part_fabricator/RefreshParts()
	var/T = 0

	//maximum stocking amount (default 300000, 600000 at T4)
	for(var/obj/item/stock_parts/matter_bin/M in component_parts)
		T += M.rating
	rmat.set_local_size((200000 + (T*50000)))

	//resources adjustment coefficient (1 -> 0.85 -> 0.7 -> 0.55)
	T = 1.15
	for(var/obj/item/stock_parts/micro_laser/Ma in component_parts)
		T -= Ma.rating*0.15
	component_coeff = T

	//building time adjustment coefficient (1 -> 0.8 -> 0.6)
	T = -1
	for(var/obj/item/stock_parts/manipulator/Ml in component_parts)
		T += Ml.rating
	time_coeff = round(initial(time_coeff) - (initial(time_coeff)*(T))/5,0.01)

	// Adjust the build time of any item currently being built.
	if(being_built)
		var/last_const_time = build_finish - build_start
		var/new_const_time = get_construction_time_w_coeff(initial(being_built.construction_time))
		var/const_time_left = build_finish - world.time
		var/new_build_time = (new_const_time / last_const_time) * const_time_left
		build_finish = world.time + new_build_time

	update_static_data_for_all_viewers()

/obj/machinery/mecha_part_fabricator/examine(mob/user)
	. = ..()
	if(in_range(user, src) || isobserver(user))
		. += span_notice("The status display reads: Storing up to <b>[rmat.local_size]</b> material units.<br>Material consumption at <b>[component_coeff*100]%</b>.<br>Build time reduced by <b>[100-time_coeff*100]%</b>.")

/obj/machinery/mecha_part_fabricator/attackby(obj/item/weapon, mob/living/user, params)
	if(panel_open && is_wire_tool(weapon))
		wires.interact(user)
		return TRUE

	if(!weapon.GetID())
		return ..()

	var/obj/item/card/id/id_card = weapon.GetID()
	if(obj_flags & EMAGGED)
		to_chat(user, span_warning("The authentication slot spits sparks at you and the display reads scrambled text!"))
		do_sparks(1, FALSE, src)
		authorization_override = TRUE //just in case it wasn't already for some reason. keycard reader is busted.
		return

	if(!(ACCESS_HEADS in id_card.access))
		return
		
	if(!authorization_override)
		authorization_override = TRUE
		to_chat(user, span_warning("You override the safety protocols on the [src], removing access restrictions from this terminal."))
	else
		authorization_override = FALSE
		to_chat(user, span_notice("You reengage the safety protocols on the [src], restoring access restrictions to this terminal."))

	update_static_data_for_all_viewers()

/**
 * All the negative wire effects
 * Break wire breaks one limb (Because pain is to be had)
*/
/obj/machinery/mecha_part_fabricator/_try_interact(mob/user)
	if(!seconds_electrified || (stat & NOPOWER))
		return ..()

	shock(user, 100)

/obj/machinery/mecha_part_fabricator/proc/wire_break(mob/user)
	if(stat & (BROKEN|NOPOWER))
		return FALSE
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(5, 1, src)
	s.start()
	var/mob/living/carbon/C = user
	var/datum/wound/blunt/severe/break_it = new
	///Picks limb to break. People with less limbs have a chance of it grapping at air
	var/obj/item/bodypart/bone = C.get_bodypart(pick(BODY_ZONE_R_ARM, BODY_ZONE_L_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_LEG))
	if(bone)
		to_chat(C,span_userdanger("The manipulator arms grapple after your [bone.name], attempting to break its bone!"))
		break_it.apply_wound(bone)
		bone.receive_damage(brute=50, updating_health=TRUE)
	else
		to_chat(C,span_userdanger("The manipulator arms attempt to grab one of your limbs, but grapple air instead!"))
		qdel(break_it)

/obj/machinery/mecha_part_fabricator/proc/reset(wire)
	if(wire != WIRE_HACK)
		return 

	if(!wires.is_cut(wire))
		hacked = FALSE

/**
  * Shock the passed in user
  *
  * This checks we have power and that the passed in prob is passed, then generates some sparks
  * and calls electrocute_mob on the user
  *
  * Arguments:
  * * user - the user to shock
  * * prb - probability the shock happens
  */
/obj/machinery/mecha_part_fabricator/proc/shock(mob/user, prb)
	if(stat & (BROKEN|NOPOWER))		// unpowered, no shock
		return FALSE

	if(!prob(prb))
		return FALSE

	do_sparks(5, TRUE, src)
	return electrocute_mob(user, get_area(src), src, 0.7, TRUE)

/**
  * Intended to be called when an item starts printing.
  *
  * Adds the overlay to show the fab working and sets active power usage settings.
  */
/obj/machinery/mecha_part_fabricator/proc/on_start_printing()
	add_overlay("fab-active")
	use_power = ACTIVE_POWER_USE

/**
  * Intended to be called when the exofab has stopped working and is no longer printing items.
  *
  * Removes the overlay to show the fab working and sets idle power usage settings. Additionally resets the description and turns off queue processing.
  */
/obj/machinery/mecha_part_fabricator/proc/on_finish_printing()
	cut_overlay("fab-active")
	use_power = IDLE_POWER_USE
	desc = initial(desc)
	process_queue = FALSE

/**
  * Calculates resource/material costs for printing an item based on the machine's resource coefficient.
  *
  * Returns a list of k,v resources with their amounts.
  * * D - Design datum to calculate the modified resource cost of.
  */
/obj/machinery/mecha_part_fabricator/proc/get_resources_w_coeff(datum/design/D)
	var/list/resources = list()
	for(var/R in D.materials)
		var/datum/material/M = R
		resources[M] = get_resource_cost_w_coeff(D, M)
	return resources

/**
  * Checks if the Exofab has enough resources to print a given item.
  *
  * Returns FALSE if the design has no reagents used in its construction (?) or if there are insufficient resources.
  * Returns TRUE if there are sufficient resources to print the item.
  * * D - Design datum to calculate the modified resource cost of.
  */
/obj/machinery/mecha_part_fabricator/proc/check_resources(datum/design/D)
	if(length(D.reagents_list)) // No reagents storage - no reagent designs.
		return FALSE
	var/datum/component/material_container/materials = rmat.mat_container
	if(materials.has_materials(get_resources_w_coeff(D)))
		return TRUE
	return FALSE

/**
  * Attempts to build the next item in the build queue.
  *
  * Returns FALSE if either there are no more parts to build or the next part is not buildable.
  * Returns TRUE if the next part has started building.
  * * verbose - Whether the machine should use say() procs. Set to FALSE to disable the machine saying reasons for failure to build.
  */
/obj/machinery/mecha_part_fabricator/proc/build_next_in_queue(verbose = TRUE)
	if(!length(queue))
		return FALSE

	var/datum/design/D = queue[1]
	if(build_part(D, verbose))
		remove_from_queue(1)
		return TRUE

	return FALSE

/**
  * Starts the build process for a given design datum.
  *
  * Returns FALSE if the procedure fails. Returns TRUE when being_built is set.
  * Uses materials.
  * * D - Design datum to attempt to print.
  * * verbose - Whether the machine should use say() procs. Set to FALSE to disable the machine saying reasons for failure to build.
  */
/obj/machinery/mecha_part_fabricator/proc/build_part(datum/design/D, verbose = TRUE)
	if(!D)
		return FALSE

	var/datum/component/material_container/materials = rmat.mat_container
	if (!materials)
		if(verbose)
			say("No access to material storage, please contact the quartermaster.")
		return FALSE
	if (rmat.on_hold())
		if(verbose)
			say("Mineral access is on hold, please contact the quartermaster.")
		return FALSE
	if(!check_resources(D))
		if(verbose)
			say("Not enough resources. Processing stopped.")
		return FALSE

	build_materials = get_resources_w_coeff(D)

	materials.use_materials(build_materials)
	being_built = D
	build_finish = world.time + get_construction_time_w_coeff(initial(D.construction_time))
	build_start = world.time
	desc = "It's building \a [D.name]."

	rmat.silo_log(src, "built", -1, "[D.name]", build_materials)

	return TRUE

/obj/machinery/mecha_part_fabricator/process()
	// Deelectrifies the machine
	if(seconds_electrified > MACHINE_NOT_ELECTRIFIED)
		seconds_electrified--

	// If there's a stored part to dispense due to an obstruction, try to dispense it.
	if(stored_part)
		var/turf/exit = get_step(src,(dir))
		if(exit.density)
			return TRUE

		say("Obstruction cleared. \The [stored_part] is complete.")
		stored_part.forceMove(exit)
		stored_part = null

	// If there's nothing being built, try to build something
	if(!being_built)
		// If we're not processing the queue anymore or there's nothing to build, end processing.
		if(!process_queue || !build_next_in_queue())
			on_finish_printing()
			end_processing()
			return TRUE
		on_start_printing()

	// If there's an item being built, check if it is complete.
	if(being_built && (build_finish < world.time))
		// Then attempt to dispense it and if appropriate build the next item.
		dispense_built_part(being_built)
		if(process_queue)
			build_next_in_queue(FALSE)
		return TRUE
	
/**
  * Dispenses a part to the tile infront of the Exosuit Fab.
  *
  * Returns FALSE is the machine cannot dispense the part on the appropriate turf.
  * Return TRUE if the part was successfully dispensed.
  * * design_to_dispense - Design datum to attempt to dispense.
  */
/obj/machinery/mecha_part_fabricator/proc/dispense_built_part(datum/design/design_to_dispense)
	var/obj/item/item_to_dispense = new design_to_dispense.build_path(src)
	
	being_built = null

	var/turf/exit = get_step(src,(dir))
	if(exit.density)
		say("Error! Part outlet is obstructed.")
		desc = "It's trying to dispense \a [D.name], but the part outlet is obstructed."
		stored_part = item_to_dispense
		return FALSE

	say("\The [item_to_dispense] is complete.")
	item_to_dispense.forceMove(exit)

	top_job_id += 1

	return TRUE

/**
  * Adds a datum design to the build queue.
  *
  * Returns TRUE if successful and FALSE if the design was not added to the queue.
  * * design_to_enqueue - Datum design to add to the queue.
  */
/obj/machinery/mecha_part_fabricator/proc/add_to_queue(datum/design/design_to_enqueue, mob/user)
	if(!(design_to_enqueue?.build_type & MECHFAB) || !design_available(design_to_enqueue, user))
		return FALSE

	if(!islist(queue))
		queue = list()

	queue[++queue.len] = design_to_enqueue
	return TRUE

/**
  * Removes datum design from the build queue based on index.
  *
  * Returns TRUE if successful and FALSE if a design was not removed from the queue.
  * * index - Index in the build queue of the element to remove.
  */
/obj/machinery/mecha_part_fabricator/proc/remove_from_queue(index)
	if(!isnum(index) || !ISINTEGER(index) || !islist(queue) || (index<1 || index>length(queue)))
		return FALSE

	queue.Cut(index,++index)
	return TRUE

/**
  * Calculates the coefficient-modified resource cost of a single material component of a design's recipe.
  *
  * Returns coefficient-modified resource cost for the given material component.
  * * D - Design datum to pull the resource cost from.
  * * resource - Material datum reference to the resource to calculate the cost of.
  * * roundto - Rounding value for round() proc
  */
/obj/machinery/mecha_part_fabricator/proc/get_resource_cost_w_coeff(datum/design/D, datum/material/resource, roundto = 1)
	return round(D.materials[resource]*component_coeff, roundto)

/**
  * Calculates the coefficient-modified build time of a design.
  *
  * Returns coefficient-modified build time of a given design.
  * * D - Design datum to calculate the modified build time of.
  * * roundto - Rounding value for round() proc
  */
/obj/machinery/mecha_part_fabricator/proc/get_construction_time_w_coeff(construction_time, roundto = 1) //aran
	return round(construction_time*time_coeff, roundto)

/obj/machinery/mecha_part_fabricator/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/spritesheet/sheetmaterials),
		get_asset_datum(/datum/asset/spritesheet/research_designs)
	)

/obj/machinery/mecha_part_fabricator/ui_status(mob/user)
	if(stat & BROKEN || panel_open)
		return UI_CLOSE
	return ..()

/obj/machinery/mecha_part_fabricator/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ExosuitFabricator")
		ui.open()

/obj/machinery/mecha_part_fabricator/ui_static_data(mob/user)
	var/list/data = list()

	data["designs"] = handle_designs(cached_designs)

	return data

/obj/machinery/mecha_part_fabricator/proc/handle_designs(list/designs)
	var/list/designs = list()

	var/datum/asset/spritesheet/research_designs/spritesheet = get_asset_datum(/datum/asset/spritesheet/research_designs)
	var/size32x32 = "[spritesheet.name]32x32"

	for(var/datum/design/design in designs)
		if (!design_available(design, user))
			continue

		var/cost = list()

		for(var/datum/material/material in design.materials)
			cost[material.name] = get_resource_cost_w_coeff(design, material)

		var/icon_size = spritesheet.icon_size_id(design.id)

		designs[design.id] = list(
			"name" = design.name,
			"desc" = design.get_description(),
			"cost" = cost,
			"id" = design.id,
			"categories" = design.category,
			"icon" = "[icon_size == size32x32 ? "" : "[icon_size] "][design.id]",
			"constructionTime" = get_construction_time_w_coeff(design.construction_time)
		)

	return designs

/obj/machinery/mecha_part_fabricator/ui_data(mob/user)
	var/list/data = list()

	data["materials"] = rmat.mat_container?.ui_data()
	data["queue"] = list()
	data["processing"] = process_queue

	if(being_built)
		data["queue"] += list(list(
			"jobId" = top_job_id,
			"designId" = being_built.id,
			"processing" = TRUE,
			"timeLeft" = (build_finish - world.time)
		))

	var/offset = 0

	for(var/datum/design/design in queue)
		offset += 1

		data["queue"] += list(list(
				"jobId" = top_job_id + offset,
				"designId" = design.id,
				"processing" = FALSE,
				"timeLeft" = get_construction_time_w_coeff(design.construction_time) / 10 DECISECONDS
		))

	return data

/// Updates the various authorization checks used to determine if combat parts are available to the current user
/obj/machinery/mecha_part_fabricator/proc/combat_parts_allowed(mob/user)
	return authorization_override || GLOB.security_level >= SEC_LEVEL_RED || head_or_silicon(user)

/**
  * Checks whether design is available for user.
  *
  * Returns TRUE if the design is available for user, FALSE otherwise.
  * * design_to_check - Design datum to check.
  * * user - Mob to check availability for.
  */
/obj/machinery/mecha_part_fabricator/proc/design_available(datum/design/design_to_check, mob/user)
	if (!design_to_check)
		return FALSE

	return !design_to_check.combat_design || combat_parts_allowed(user)

/// made as a lazy check to allow silicons full access always
/obj/machinery/mecha_part_fabricator/proc/head_or_silicon(mob/user)
	if(!user)
		return FALSE

	if(issilicon(user))
		return TRUE

	return ACCESS_HEADS in user.get_idcard(hand_first = TRUE)?.access

/obj/machinery/mecha_part_fabricator/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	. = TRUE

	add_fingerprint(usr)
	usr.set_machine(src)

	switch(action)
		if("build")
			var/designs = params["designs"]

			if(!islist(designs))
				return

			for(var/design_id in designs)
				if(!istext(design_id))
					continue

				if(!stored_research.researched_designs.Find(design_id))
					continue

				var/datum/design/design = SSresearch.techweb_design_by_id(design_id)

				if(design.id != design_id)
					continue

				add_to_queue(design, usr)

			if(params["now"])
				if(process_queue)
					return


				process_queue = TRUE

				if(!being_built)
					begin_processing()

			return

		if("del_queue_part")
			// Delete a specific from from the queue
			var/index = text2num(params["index"])
			remove_from_queue(index)

			return

		if("clear_queue")
			// Delete everything from queue
			queue.Cut()

			return

		if("build_queue")
			// Build everything in queue
			if(process_queue)
				return

			process_queue = TRUE

			if(!being_built)
				begin_processing()

			return

		if("stop_queue")
			// Pause queue building. Also known as stop.
			process_queue = FALSE

			return

		if("remove_mat")
			var/datum/material/material = locate(params["ref"])
			var/amount = text2num(params["amount"])

			if (!amount)
				return

			// SAFETY: eject_sheets checks for valid mats
			rmat.eject_sheets(material, amount)
			return

	return FALSE

/obj/machinery/mecha_part_fabricator/proc/AfterMaterialInsert(item_inserted, id_inserted, amount_inserted)
	var/datum/material/M = id_inserted
	add_overlay("fab-load-[M.name]")
	addtimer(CALLBACK(src, /atom/proc/cut_overlay, "fab-load-[M.name]"), 10)

/obj/machinery/mecha_part_fabricator/screwdriver_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	if(being_built)
		to_chat(user, span_warning("\The [src] is currently processing! Please wait until completion."))
		return FALSE
	return default_deconstruction_screwdriver(user, "fab-o", "fab-idle", I)

/obj/machinery/mecha_part_fabricator/crowbar_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	if(being_built)
		to_chat(user, span_warning("\The [src] is currently processing! Please wait until completion."))
		return FALSE
	return default_deconstruction_crowbar(I)

/obj/machinery/mecha_part_fabricator/proc/is_insertion_ready(mob/user)
	if(panel_open)
		to_chat(user, span_warning("You can't load [src] while it's panel is opened!"))
		return FALSE
	if(being_built)
		to_chat(user, span_warning("\The [src] is currently processing! Please wait until completion."))
		return FALSE
	return TRUE

/obj/machinery/mecha_part_fabricator/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		to_chat(user, span_warning("[src] has no functional safeties to emag."))
		return
	do_sparks(1, FALSE, src)
	to_chat(user, span_notice("You short out [src]'s safeties."))
	authorization_override = TRUE
	obj_flags |= EMAGGED

	update_static_data_for_all_viewers()

/obj/machinery/mecha_part_fabricator/maint
	link_on_init = FALSE

/obj/machinery/mecha_part_fabricator/ruin
	link_on_init = FALSE
	authorization_override = TRUE
	hacked = TRUE

/obj/machinery/mecha_part_fabricator/ruin/Initialize(mapload)
	. = ..()
	stored_research = SSresearch.ruin_tech
