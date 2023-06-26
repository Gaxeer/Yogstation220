/datum/design/bluespace_pipe
	name = "Bluespace Pipe"
	desc = "A pipe that teleports gases."
	id = "bluespace_pipe"
	build_type = PROTOLATHE
	materials = list(/datum/material/gold = 1000, /datum/material/diamond = 750, /datum/material/uranium = 250, /datum/material/bluespace = 2000)
	build_path = /obj/item/pipe/bluespace
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_BLUESPACE
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING
