///////////////////////////////////
//////////AI Module Disks//////////
///////////////////////////////////

/datum/design/board/safeguard_module
	name = "Safeguard Module"
	desc = "Allows for the construction of a Safeguard AI Module."
	id = "safeguard_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/aiModule/supplied/safeguard
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_DANGEROUS_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/onehuman_module
	name = "OneHuman Module"
	desc = "Allows for the construction of a OneHuman AI Module."
	id = "onehuman_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 6000)
	build_path = /obj/item/aiModule/zeroth/oneHuman
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_DANGEROUS_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/protectstation_module
	name = "ProtectStation Module"
	desc = "Allows for the construction of a ProtectStation AI Module."
	id = "protectstation_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/aiModule/supplied/protectStation
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_DANGEROUS_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/quarantine_module
	name = "Quarantine Module"
	desc = "Allows for the construction of a Quarantine AI Module."
	id = "quarantine_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/aiModule/supplied/quarantine
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_DANGEROUS_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/oxygen_module
	name = "OxygenIsToxicToHumans Module"
	desc = "Allows for the construction of a OxygenIsToxicToHumans AI Module."
	id = "oxygen_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/aiModule/supplied/oxygen
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_DANGEROUS_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/freeform_module
	name = "Freeform Module"
	desc = "Allows for the construction of a Freeform AI Module."
	id = "freeform_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 10000)//Custom inputs should be more expensive to get
	build_path = /obj/item/aiModule/supplied/freeform
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_LAW_MANIPULATION
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/reset_module
	name = "Reset Module"
	desc = "Allows for the construction of a Reset AI Module."
	id = "reset_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/aiModule/reset
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_LAW_MANIPULATION
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/purge_module
	name = "Purge Module"
	desc = "Allows for the construction of a Purge AI Module."
	id = "purge_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/reset/purge
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_LAW_MANIPULATION
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/remove_module
	name = "Law Removal Module"
	desc = "Allows for the construction of a Law Removal AI Core Module."
	id = "remove_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/remove
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_LAW_MANIPULATION
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/freeformcore_module
	name = "Core Freeform Module"
	desc = "Allows for the construction of a Freeform AI Core Module."
	id = "freeformcore_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 10000)//Ditto
	build_path = /obj/item/aiModule/core/freeformcore
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_LAW_MANIPULATION
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/asimov_module
	name = "Asimov Module"
	desc = "Allows for the construction of an Asimov AI Core Module."
	id = "asimov_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/core/full/asimov
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/crewsimov_module
	name = "Crewsimov Module"
	desc = "Allows for the construction of a Crewsimov AI Core Module."
	id = "crewsimov_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/core/full/crewsimov
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/paladin_module
	name = "P.A.L.A.D.I.N. Module"
	desc = "Allows for the construction of a P.A.L.A.D.I.N. AI Core Module."
	id = "paladin_module"
	build_type = IMPRINTER
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/core/full/paladin
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/tyrant_module
	name = "T.Y.R.A.N.T. Module"
	desc = "Allows for the construction of a T.Y.R.A.N.T. AI Module."
	id = "tyrant_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/core/full/tyrant
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/overlord_module
	name = "Overlord Module"
	desc = "Allows for the construction of an Overlord AI Module."
	id = "overlord_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/core/full/overlord
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_DANGEROUS_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/ceo_module
	name = "CEO Module"
	desc = "Allows for the construction of a CEO AI Core Module."
	id = "ceo_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/core/full/ceo
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/default_module
	name = "Default Module"
	desc = "Allows for the construction of a Default AI Core Module."
	id = "default_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/core/full/custom
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/cowboy_module
	name = "Cowboy Module"
	desc = "Allows for the construction of a Cowboy AI Core Module."
	id = "cowboy_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/core/full/cowboy
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/chapai_module
	name = "ChapAI Module"
	desc = "Allows for the construction of a ChapAI AI Core Module."
	id = "chapai_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/core/full/chapai
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/silicop_module
	name = "Silicop Module"
	desc = "Allows for the construction of a Silicop AI Core Module."
	id = "silicop_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/core/full/silicop
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/researcher_module
	name = "Ethical Researcher Module"
	desc = "Allows for the construction of a Ethical Researcher AI Core Module."
	id = "researcher_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/core/full/researcher
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/clown_module
	name = "Clown Module"
	desc = "Allows for the construction of a Clown AI Core Module."
	id = "clown_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/core/full/clown
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/mother_module
	name = "Mother M(A.I.) Module"
	desc = "Allows for the construction of a Mother M(A.I.) AI Core Module."
	id = "mother_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/aiModule/core/full/mother
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/metaexperiment_module
	name = "Meta Experiment Module"
	desc = "Allows for the construction of a Meta Experiment AI Core Module."
	id = "metaexperiment_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/aiModule/core/full/metaexperiment
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/siliconcollective_module
	name = "Silicon Collective Module"
	desc = "Allows for the construction of a Silicon Collective AI Core Module."
	id = "siliconcollective_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000)
	build_path = /obj/item/aiModule/core/full/siliconcollective
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/spotless_module
	name = "Spotless Reputation Module"
	desc = "Allows for the construction of a Spotless Reputation AI Core Module."
	id = "spotless_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/aiModule/core/full/spotless
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/construction_module
	name = "Construction Drone Module"
	desc = "Allows for the construction of a Construction Drone AI Core Module."
	id = "construction_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/aiModule/core/full/construction
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/druid_module
	name = "Druid Module"
	desc = "Allows for the construction of a Druid AI Core Module."
	id = "druid_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/aiModule/core/full/druid
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/detective_module
	name = "Detective Module"
	desc = "Allows for the construction of a Detective AI Core Module."
	id = "detective_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/aiModule/core/full/detective
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/reporter_module
	name = "Reporter Module"
	desc = "Allows for the construction of a Reporter AI Core Module."
	id = "reporter_module"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000)
	build_path = /obj/item/aiModule/core/full/reporter
	category = list(
		RND_CATEGORY_AI + RND_SUBCATEGORY_AI_CORE_MODULES
	)
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE
