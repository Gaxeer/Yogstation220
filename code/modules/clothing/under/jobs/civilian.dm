//Alphabetical order of civilian jobs.

/obj/item/clothing/under/rank/bartender
	desc = "It looks like it could use some more flair."
	name = "bartender's uniform"
	icon_state = "barman"
	item_state = "bar_suit"
	alt_covers_chest = TRUE
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/bartender/purple
	desc = "It looks like it has lots of flair!"
	name = "purple bartender's uniform"
	icon_state = "purplebartender"
	item_state = "purplebartender"
	can_adjust = FALSE

/obj/item/clothing/under/rank/bartender/skirt
	name = "bartender's skirt"
	desc = "It looks like it could use some more flair."
	icon_state = "barman_skirt"
	item_state = "bar_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/captain //Alright, technically not a 'civilian' but its better then giving a .dm file for a single define.
	desc = "It's a blue jumpsuit with some gold markings denoting the rank of \"Captain\"."
	name = "captain's jumpsuit"
	icon_state = "captain"
	item_state = "b_suit"
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 0, WOUND = 15)
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/captain/skirt
	name = "captain's jumpskirt"
	desc = "It's a blue jumpskirt with some gold markings denoting the rank of \"Captain\"."
	icon_state = "captain_skirt"
	item_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/cargo
	name = "quartermaster's jumpsuit"
	desc = "It's a jumpsuit worn by the quartermaster. It's specially designed to prevent back injuries caused by pushing paper."
	icon_state = "qm"
	item_state = "lb_suit"
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/cargo/skirt
	name = "quartermaster's jumpskirt"
	desc = "It's a jumpskirt worn by the quartermaster. It's specially designed to prevent back injuries caused by pushing paper."
	icon_state = "qm_skirt"
	item_state = "lb_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/cargotech
	name = "cargo technician's jumpsuit"
	desc = "Shooooorts! They're comfy and easy to wear!"
	icon_state = "cargotech"
	item_state = "lb_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	mutantrace_variation = MUTANTRACE_VARIATION
	alt_covers_chest = TRUE
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/cargotech/skirt
	name = "cargo technician's jumpskirt"
	desc = "Skiiiiirts! They're comfy and easy to wear!"
	icon_state = "cargo_skirt"
	item_state = "lb_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	mutantrace_variation = NO_MUTANTRACE_VARIATION
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/chaplain
	desc = "It's a black jumpsuit, often worn by religious folk."
	name = "chaplain's jumpsuit"
	icon_state = "chaplain"
	item_state = "bl_suit"
	can_adjust = FALSE
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/chaplain/skirt
	name = "chaplain's jumpskirt"
	desc = "It's a black jumpskirt, often worn by religious folk."
	icon_state = "chapblack_skirt"
	item_state = "bl_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/chef
	name = "cook's suit"
	desc = "A suit which is given only to the most <b>hardcore</b> cooks in space."
	icon_state = "chef"
	alt_covers_chest = TRUE
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/chef/skirt
	name = "cook's skirt"
	desc = "A skirt which is given only to the most <b>hardcore</b> cooks in space."
	icon_state = "chef_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION
/obj/item/clothing/under/rank/clown
	name = "clown suit"
	desc = "<i>'HONK!'</i>"
	icon_state = "clown"
	item_state = "clown"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/blueclown
	name = "blue clown suit"
	desc = "<i>'BLUE HONK!'</i>"
	icon_state = "blueclown"
	item_state = "blueclown"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/greenclown
	name = "green clown suit"
	desc = "<i>'GREEN HONK!'</i>"
	icon_state = "greenclown"
	item_state = "greenclown"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/yellowclown
	name = "yellow clown suit"
	desc = "<i>'YELLOW HONK!'</i>"
	icon_state = "yellowclown"
	item_state = "yellowclown"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/purpleclown
	name = "purple clown suit"
	desc = "<i>'PURPLE HONK!'</i>"
	icon_state = "purpleclown"
	item_state = "purpleclown"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/orangeclown
	name = "orange clown suit"
	desc = "<i>'ORANGE HONK!'</i>"
	icon_state = "orangeclown"
	item_state = "orangeclown"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/rainbowclown
	name = "rainbow clown suit"
	desc = "<i>'R A I N B O W HONK!'</i>"
	icon_state = "rainbowclown"
	item_state = "rainbowclown"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/clown/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/items/bikehorn.ogg'=1), 50)

/obj/item/clothing/under/rank/head_of_personnel
	desc = "It's a jumpsuit worn by someone who works in the position of \"Head of Personnel\"."
	name = "head of personnel's jumpsuit"
	icon_state = "hop"
	item_state = "b_suit"
	can_adjust = FALSE
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/head_of_personnel/skirt
	name = "head of personnel's jumpskirt"
	desc = "It's a jumpskirt worn by someone who works in the position of \"Head of Personnel\"."
	icon_state = "hop_skirt"
	item_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/hydroponics
	desc = "It's a jumpsuit designed to protect against minor plant-related hazards."
	name = "botanist's jumpsuit"
	icon_state = "hydroponics"
	item_state = "g_suit"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 5, RAD = 0, FIRE = 0, ACID = 0)
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/hydroponics/skirt
	name = "botanist's jumpskirt"
	desc = "It's a jumpskirt designed to protect against minor plant-related hazards."
	icon_state = "hydroponics_skirt"
	item_state = "g_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/janitor
	desc = "It's the official uniform of the station's janitor. It has minor protection from biohazards."
	name = "janitor's jumpsuit"
	icon_state = "janitor"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 10, RAD = 0, FIRE = 0, ACID = 0)
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/janitor/skirt
	name = "janitor's jumpskirt"
	desc = "It's the official skirt of the station's janitor. It has minor protection from biohazards."
	icon_state = "janitor_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/lawyer
	desc = "Slick threads."
	name = "Lawyer suit"
	can_adjust = FALSE

/obj/item/clothing/under/lawyer/black
	icon_state = "lawyer_black"
	item_state = "lawyer_black"
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/lawyer/black/skirt
	name = "Lawyer black suitskirt"
	icon_state = "lawyer_black_skirt"
	item_state = "lawyer_black"
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/lawyer/female
	icon_state = "black_suit_fem"
	item_state = "black_suit_fem"
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/lawyer/red
	icon_state = "lawyer_red"
	item_state = "lawyer_red"
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/lawyer/red/skirt
	name = "Lawyer red suitskirt"
	icon_state = "lawyer_red_skirt"
	item_state = "lawyer_red"
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/lawyer/blue
	icon_state = "lawyer_blue"
	item_state = "lawyer_blue"
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/lawyer/blue/skirt
	name = "Lawyer blue suitskirt"
	icon_state = "lawyer_blue_skirt"
	item_state = "lawyer_blue"
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/lawyer/bluesuit
	name = "blue suit"
	desc = "A classy suit and tie."
	icon_state = "bluesuit"
	item_state = "bluesuit"
	can_adjust = TRUE
	alt_covers_chest = TRUE
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/lawyer/bluesuit/skirt
	name = "blue suitskirt"
	desc = "A classy suitskirt and tie."
	icon_state = "bluesuit_skirt"
	item_state = "bluesuit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/lawyer/purpsuit
	name = "purple suit"
	icon_state = "lawyer_purp"
	item_state = "lawyer_purp"
	fitted = NO_FEMALE_UNIFORM
	can_adjust = TRUE
	alt_covers_chest = TRUE
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/lawyer/purpsuit/skirt
	name = "purple suitskirt"
	icon_state = "lawyer_purp_skirt"
	item_state = "lawyer_purp"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/lawyer/blacksuit
	name = "black suit"
	desc = "A professional black suit. Nanotrasen Investigation Bureau approved!"
	icon_state = "blacksuit"
	item_state = "bar_suit"
	can_adjust = TRUE
	alt_covers_chest = TRUE
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/lawyer/blacksuit/skirt
	name = "black suitskirt"
	desc = "A professional black suitskirt. Nanotrasen Investigation Bureau approved!"
	icon_state = "reallyblack_suit_skirt"
	item_state = "bar_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/curator
	name = "sensible suit"
	desc = "It's very... sensible."
	icon_state = "red_suit"
	item_state = "red_suit"
	can_adjust = FALSE
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/curator/skirt
	name = "sensible suitskirt"
	desc = "It's very... sensible."
	icon_state = "red_suit_skirt"
	item_state = "red_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/curator/treasure_hunter
	name = "treasure hunter uniform"
	desc = "A rugged uniform suitable for treasure hunting."
	icon_state = "curator"
	item_state = "curator"

/obj/item/clothing/under/rank/mime
	name = "mime's outfit"
	desc = "It's not very colourful."
	icon_state = "mime"
	item_state = "mime"
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/mime/skirt
	name = "mime's skirt"
	desc = "It's not very colourful."
	icon_state = "mime_skirt"
	item_state = "mime"
	body_parts_covered = CHEST|GROIN|ARMS
	dying_key = DYE_REGISTRY_JUMPSKIRT
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/artist
	name = "post-modern suit"
	desc = "Only the most modern of folk have the right to wear this suit."
	icon_state = "artist"
	item_state = "artist"
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/artist/skirt
	name = "post-modern skirt"
	desc = "Only the most modern of folk have the right to wear this suit."
	icon_state = "artist_skirt"
	item_state = "artist"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION
	

/obj/item/clothing/under/rank/miner
	desc = "It's a snappy jumpsuit with a sturdy set of overalls. It is very dirty."
	name = "shaft miner's jumpsuit"
	icon_state = "miner"
	item_state = "miner"
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 80, ACID = 0, WOUND = 10)
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/miner/lavaland
	desc = "A green uniform for operating in hazardous environments."
	name = "shaft miner's jumpsuit"
	icon_state = "explorer"
	item_state = "explorer"
	can_adjust = FALSE
