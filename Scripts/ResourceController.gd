extends Node

onready var air_sub_label: Label = get_node("../Elements/Air/Subresource")
onready var earth_sub_label: Label = get_node("../Elements/Earth/Subresource")
onready var fire_sub_label: Label = get_node("../Elements/Fire/Subresource")
onready var water_sub_label: Label = get_node("../Elements/Water/Subresource")
onready var resource_log: Label = get_node("../ResourceLog")

var list = ResourceList

var air_sub_count = 0
var earth_sub_count = 0
var fire_sub_count = 0
var water_sub_count = 0

var r_clicker = 1

func resources(r1, r2, r3):
	disable_groups()
	
	print("The resources available are as follows:")
	find_resource(r1)
	find_resource(r2)
	if ResearchDB.warp_3():
		find_resource(r3)
	log_resources(r1, r2, r3)

func find_resource(r):
	match r:
		0:
			print("AIR")
			enable_resource("air")
		1:
			print("EARTH")
			enable_resource("earth")
		2:
			print ("FIRE")
			enable_resource("fire")
		3:
			print("WATER")
			enable_resource("water")

func disable_groups():
	for r in get_tree().get_nodes_in_group("air"):
		r.visible = false
	for r in get_tree().get_nodes_in_group("earth"):
		r.visible = false
	for r in get_tree().get_nodes_in_group("fire"):
		r.visible = false
	for r in get_tree().get_nodes_in_group("water"):
		r.visible = false

func research_unlock(r1, r2, r3):
	enable_resource(get_resource_name(r1))
	enable_resource(get_resource_name(r2))
	if ResearchDB.warp_3():
		enable_resource(get_resource_name(r3))

func get_resource_name(r: int) -> String:
	match r:
		0:
			return "air"
		1:
			return "earth"
		2:
			return "fire"
		3:
			return "water"
		4:
			return "light"
	return ""

func get_subresource_name(r: int) -> String:
	match r:
		0:
			return "Cloud Puffs"
		1:
			return "Obsidian Chunks"
		2:
			return "Glowing Roses"
		3:
			return "Coral Crystals"
	return ""

func air_resource():
	for r in get_tree().get_nodes_in_group("air"):
		r.visible = true

func earth_resource():
	for r in get_tree().get_nodes_in_group("earth"):
		r.visible = true

func fire_resource():
	for r in get_tree().get_nodes_in_group("fire"):
		r.visible = true

func water_resource():
	for r in get_tree().get_nodes_in_group("water"):
		r.visible = true

func enable_resource(element: String):
	for r in get_tree().get_nodes_in_group(element):
		if r.is_in_group("advanced") && !ResearchDB.prod_1():
			r.visible = false
		else:
			r.visible = true

func add_sub_element(amount, element):
	match element:
		list.RES.AIR, list.RES.SUBAIR:
			air_sub_count += amount
			ElementUI.display_element(air_sub_label, "Cloud Puffs: %s", air_sub_count)
		list.RES.EARTH, list.RES.SUBEARTH:
			earth_sub_count += amount
			ElementUI.display_element(earth_sub_label, "Obsidian Chunks: %s", earth_sub_count)
		list.RES.FIRE, list.RES.SUBFIRE:
			fire_sub_count += amount
			ElementUI.display_element(fire_sub_label, "Glowing Roses: %s", fire_sub_count)
		list.RES.WATER, list.RES.SUBWATER:
			water_sub_count += amount
			ElementUI.display_element(water_sub_label, "Coral Crystals: %s", water_sub_count)

func can_afford(amount, element):
	match element:
		list.RES.AIR, list.RES.SUBAIR:
			return true if air_sub_count - amount >= 0 else false
		list.RES.EARTH, list.RES.SUBEARTH:
			return true if earth_sub_count - amount >= 0 else false
		list.RES.FIRE, list.RES.SUBFIRE:
			return true if fire_sub_count - amount >= 0 else false
		list.RES.WATER, list.RES.SUBWATER:
			return true if water_sub_count - amount >= 0 else false

func log_resources(r1, r2, r3):
	if ResearchDB.warp_3():
		resource_log.set_text("The resources available in this dimension are " + get_subresource_name(r1) + ", " + get_subresource_name(r2) + ", and " + get_subresource_name(r3) + ".")
	else:
		resource_log.set_text("The resources available in this dimension are " + get_subresource_name(r1) + " and " + get_subresource_name(r2) + ".")

func _on_air_sub_gather_button_pressed():
	add_sub_element(r_clicker, list.RES.AIR)
	SoundPlayer.play_category(SoundPlayer.CLOUDPUFFSOUNDS)

func _on_earth_sub_gather_button_pressed():
	add_sub_element(r_clicker, list.RES.EARTH)
	SoundPlayer.play_category(SoundPlayer.OBSIDIANCHUNKSOUNDS)

func _on_fire_sub_gather_button_pressed():
	add_sub_element(r_clicker, list.RES.FIRE)
	SoundPlayer.play_category(SoundPlayer.GLOWINGROSESOUNDS)

func _on_water_sub_gather_button_pressed():
	add_sub_element(r_clicker, list.RES.WATER)
	SoundPlayer.play_category(SoundPlayer.CORALCRYSTALSOUNDS)

func wipe():
	add_sub_element(-1 * air_sub_count, list.RES.SUBAIR)
	add_sub_element(-1 * earth_sub_count, list.RES.SUBEARTH)
	add_sub_element(-1 * fire_sub_count, list.RES.SUBFIRE)
	add_sub_element(-1 * water_sub_count, list.RES.SUBWATER)
