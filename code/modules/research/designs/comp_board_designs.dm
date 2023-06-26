///////////////////Computer Boards///////////////////////////////////

/datum/design/board
	name = "NULL ENTRY Board"
	desc = "I promise this doesn't give you syndicate goodies!"
	build_type = IMPRINTER
	materials = list(/datum/material/glass = 1000)

/datum/design/board/arcade_battle
	name = "Battle Arcade Machine Board"
	desc = "Allows for the construction of circuit boards used to build a new arcade machine."
	id = "arcade_battle"
	build_path = /obj/item/circuitboard/computer/arcade/battle
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENTERTAINMENT
	)
	departmental_flags = DEPARTMENTAL_FLAG_ALL

/datum/design/board/orion_trail
	name = "Orion Trail Arcade Machine Board"
	desc = "Allows for the construction of circuit boards used to build a new Orion Trail machine."
	id = "arcade_orion"
	build_path = /obj/item/circuitboard/computer/arcade/orion_trail
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENTERTAINMENT
	)
	departmental_flags = DEPARTMENTAL_FLAG_ALL

/datum/design/board/seccamera
	name = "Security Camera Board"
	desc = "Allows for the construction of circuit boards used to build security camera computers."
	id = "seccamera"
	build_path = /obj/item/circuitboard/computer/security
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_SECURITY
	)
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/board/rdcamera
	name = "Research Monitor Board"
	desc = "Allows for the construction of circuit boards used to build research camera computers."
	id = "rdcamera"
	build_path = /obj/item/circuitboard/computer/research
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_RESEARCH
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/xenobiocamera
	name = "Xenobiology Console Board"
	desc = "Allows for the construction of circuit boards used to build xenobiology camera computers."
	id = "xenobioconsole"
	build_path = /obj/item/circuitboard/computer/xenobiology
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_RESEARCH
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/med_data
	name = "Medical Records Board"
	desc = "Allows for the construction of circuit boards used to build a medical records console."
	id = "med_data"
	build_path = /obj/item/circuitboard/computer/med_data
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_MEDICAL
	)
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/board/operating
	name = "Operating Computer Board"
	desc = "Allows for the construction of circuit boards used to build an operating computer console."
	id = "operating"
	build_path = /obj/item/circuitboard/computer/operating
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_MEDICAL
	)
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/pandemic
	name = "PanD.E.M.I.C. 2200 Board"
	desc = "Allows for the construction of circuit boards used to build a PanD.E.M.I.C. 2200 console."
	id = "pandemic"
	build_path = /obj/item/circuitboard/computer/pandemic
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_MEDICAL
	)
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/board/scan_console
	name = "DNA Scanning Console Board"
	desc = "Allows for the construction of circuit boards used to build a DNA scanning console."
	id = "scan_console"
	build_path = /obj/item/circuitboard/computer/scan_consolenew
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_MEDICAL
	)
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/comconsole
	name = "Communications Board"
	desc = "Allows for the construction of circuit boards used to build a communications console."
	id = "comconsole"
	build_path = /obj/item/circuitboard/computer/communications
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_COMMAND
	)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SECURITY				//Honestly should have a bridge techfab for this sometime.

/datum/design/board/idcardconsole
	name = "ID Console Board"
	desc = "Allows for the construction of circuit boards used to build an ID computer."
	id = "idcardconsole"
	build_path = /obj/item/circuitboard/computer/card
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_COMMAND
	)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SECURITY				//Honestly should have a bridge techfab for this sometime.

/datum/design/board/crewconsole
	name = "Crew Monitoring Computer Board"
	desc = "Allows for the construction of circuit boards used to build a crew monitoring computer."
	id = "crewconsole"
	build_path = /obj/item/circuitboard/computer/crew
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_MEDICAL
	)
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/board/secdata
	name = "Security Records Console Board"
	desc = "Allows for the construction of circuit boards used to build a security records console."
	id = "secdata"
	build_path = /obj/item/circuitboard/computer/secure_data
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_SECURITY
	)
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/board/atmosalerts
	name = "Atmosphere Alert Board"
	desc = "Allows for the construction of circuit boards used to build an atmosphere alert console."
	id = "atmosalerts"
	build_path = /obj/item/circuitboard/computer/atmos_alert
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENGINEERING
	)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/atmos_control
	name = "Atmospheric Monitor Board"
	desc = "Allows for the construction of circuit boards used to build an Atmospheric Monitor."
	id = "atmos_control"
	build_path = /obj/item/circuitboard/computer/atmos_control
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENGINEERING
	)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/robocontrol
	name = "Robotics Control Console Board"
	desc = "Allows for the construction of circuit boards used to build a Robotics Control console."
	id = "robocontrol"
	build_path = /obj/item/circuitboard/computer/robotics
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ROBOTICS
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/slot_machine
	name = "Slot Machine Board"
	desc = "Allows for the construction of circuit boards used to build a slot machine."
	id = "slotmachine"
	build_path = /obj/item/circuitboard/computer/slot_machine
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENTERTAINMENT
	)
	departmental_flags = DEPARTMENTAL_FLAG_ALL

/datum/design/board/powermonitor
	name = "Power Monitor Board"
	desc = "Allows for the construction of circuit boards used to build a power monitor."
	id = "powermonitor"
	build_path = /obj/item/circuitboard/computer/powermonitor
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENGINEERING
	)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/solarcontrol
	name = "Solar Control Board"
	desc = "Allows for the construction of circuit boards used to build a solar control console."
	id = "solarcontrol"
	build_path = /obj/item/circuitboard/computer/solar_control
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENGINEERING
	)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/prisonmanage
	name = "Prisoner Management Console Board"
	desc = "Allows for the construction of circuit boards used to build a prisoner management console."
	id = "prisonmanage"
	build_path = /obj/item/circuitboard/computer/prisoner
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_SECURITY
	)
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/board/mechacontrol
	name = "Exosuit Control Console Board"
	desc = "Allows for the construction of circuit boards used to build an exosuit control console."
	id = "mechacontrol"
	build_path = /obj/item/circuitboard/computer/mecha_control
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ROBOTICS
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/mechapower
	name = "Mech Bay Power Control Console Board"
	desc = "Allows for the construction of circuit boards used to build a mech bay power control console."
	id = "mechapower"
	build_path = /obj/item/circuitboard/computer/mech_bay_power_console
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ROBOTICS
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/rdconsole
	name = "R&D Console Board"
	desc = "Allows for the construction of circuit boards used to build an R&D console."
	id = "rdconsole"
	build_path = /obj/item/circuitboard/computer/rdconsole
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_RESEARCH
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/cargo
	name = "Supply Console Board"
	desc = "Allows for the construction of circuit boards used to build a Supply Console."
	id = "cargo"
	build_path = /obj/item/circuitboard/computer/cargo
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_CARGO
	)
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/board/cargorequest
	name = "Supply Request Console Board"
	desc = "Allows for the construction of circuit boards used to build a Supply Request Console."
	id = "cargorequest"
	build_path = /obj/item/circuitboard/computer/cargo/request
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_CARGO
	)
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/board/bounty
	name = "Bounty Console Board"
	desc = "Allows for the construction of circuit boards used to build a Bounty Console."
	id = "bounty"
	build_path = /obj/item/circuitboard/computer/bounty
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_CARGO
	)
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/board/mining
	name = "Outpost Status Display Board"
	desc = "Allows for the construction of circuit boards used to build an outpost status display console."
	id = "mining"
	build_path = /obj/item/circuitboard/computer/mining
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_CARGO
	)
	departmental_flags = DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SECURITY

/datum/design/board/comm_monitor
	name = "Telecommunications Monitoring Console Board"
	desc = "Allows for the construction of circuit boards used to build a telecommunications monitor."
	id = "comm_monitor"
	build_path = /obj/item/circuitboard/computer/comm_monitor
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENGINEERING
	)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/comm_server
	name = "Telecommunications Server Monitoring Console Board"
	desc = "Allows for the construction of circuit boards used to build a telecommunications server browser and monitor."
	id = "comm_server"
	build_path = /obj/item/circuitboard/computer/comm_server
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENGINEERING
	)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/message_monitor
	name = "Messaging Monitor Console Board"
	desc = "Allows for the construction of circuit boards used to build a messaging monitor console."
	id = "message_monitor"
	build_path = /obj/item/circuitboard/computer/message_monitor
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENGINEERING
	)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/aifixer
	name = "AI Integrity Restorer Board"
	desc = "Allows for the construction of circuit boards used to build an AI Integrity Restorer."
	id = "aifixer"
	build_path = /obj/item/circuitboard/computer/aifixer
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ROBOTICS
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/libraryconsole
	name = "Library Console Board"
	desc = "Allows for the construction of circuit boards used to build a library console."
	id = "libraryconsole"
	build_path = /obj/item/circuitboard/computer/libraryconsole
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENTERTAINMENT
	)
	departmental_flags = DEPARTMENTAL_FLAG_ALL

/datum/design/board/apc_control
	name = "APC Control Board"
	desc = "Allows for the construction of circuit boards used to build an APC control console."
	id = "apc_control"
	build_path = /obj/item/circuitboard/computer/apc_control
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENGINEERING
	)
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/nanite_chamber_control
	name = "Nanite Chamber Control Console Board"
	desc = "Allows for the construction of circuit boards used to build a nanite chamber control console."
	id = "nanite_chamber_control"
	build_path = /obj/item/circuitboard/computer/nanite_chamber_control
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_NANITES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/nanite_cloud_control
	name = "Nanite Cloud Control Console Board"
	desc = "Allows for the construction of circuit boards used to build a nanite cloud control console."
	id = "nanite_cloud_control"
	build_path = /obj/item/circuitboard/computer/nanite_cloud_controller
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_NANITES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/shuttle/flight_control
	name = "Shuttle Flight Controller Board"
	desc = "Allows for the construction of circuit boards used to build a console that enables shuttle flight"
	id = "shuttle_control"
	build_path = /obj/item/circuitboard/computer/shuttle/flight_control
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENGINEERING
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/shuttle/shuttle_docker
	name = "Shuttle Zoning Designator Board"
	desc = "Allows for the construction of circuit boards used to build a console that enables the targetting of custom flight locations"
	id = "shuttle_docker"
	build_path = /obj/item/circuitboard/computer/shuttle/docker
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENGINEERING
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING


/datum/design/board/ai_server_overview
	name = "Computer Design (AI Server Overview Console)"
	desc = "Allows for the construction of circuit boards used to build an AI Server Overview console."
	id = "ai_server_overview"
	build_path = /obj/item/circuitboard/computer/ai_server_overview
	category = category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_RESEARCH
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/ai_resource_distribution
	name = "Computer Design (AI Resource Distribution Console)"
	desc = "Allows for the construction of circuit boards used to build an AI Resource Distribution console."
	id = "ai_resource_distribution"
	build_path = /obj/item/circuitboard/computer/ai_resource_distribution
	category = category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_RESEARCH
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE
