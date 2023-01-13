extends Node

onready var air_sub_label: Label = get_node("../Elements/Air/Subresource")
onready var earth_sub_label: Label = get_node("../Elements/Earth/Subresource")
onready var fire_sub_label: Label = get_node("../Elements/Fire/Subresource")
onready var water_sub_label: Label = get_node("../Elements/Water/Subresource")

var list = ResourceList

var air_sub_count = 0
var earth_sub_count = 0
var fire_sub_count = 0
var water_sub_count = 0

var r_clicker = 1

func resources(r1, r2):
	disable_groups()
	
	print("The resources available are as follows:")
	match r1:
		0:
			print("AIR")
			air_resource()
		1:
			print("EARTH")
			earth_resource()
		2:
			print ("FIRE")
			fire_resource()
		3:
			print("WATER")
			water_resource()
	match r2:
		0:
			print("AIR")
			air_resource()
		1:
			print("EARTH")
			earth_resource()
		2:
			print ("FIRE")
			fire_resource()
		3:
			print("WATER")
			water_resource()

func disable_groups():
	for r in get_tree().get_nodes_in_group("air"):
		r.visible = false
	for r in get_tree().get_nodes_in_group("earth"):
		r.visible = false
	for r in get_tree().get_nodes_in_group("fire"):
		r.visible = false
	for r in get_tree().get_nodes_in_group("water"):
		r.visible = false

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

func _on_air_sub_gather_button_pressed():
	add_sub_element(r_clicker, list.RES.AIR)

func add_sub_element(amount, element):
	match element:
		list.RES.AIR, list.RES.SUBAIR:
			air_sub_count += amount
			air_sub_label.text = "Cloud Puffs: %s" % air_sub_count
		list.RES.EARTH, list.RES.SUBEARTH:
			earth_sub_count += amount
			earth_sub_label.text = "Obsidian Chunks: %s" % earth_sub_count
		list.RES.FIRE, list.RES.SUBFIRE:
			fire_sub_count += amount
			fire_sub_label.text = "Glowing Roses: %s" % fire_sub_count
		list.RES.WATER, list.RES.SUBWATER:
			water_sub_count += amount
			water_sub_label.text = "Coral Crystals %s" % water_sub_count

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

func _on_earth_sub_gather_button_pressed():
	add_sub_element(r_clicker, list.RES.EARTH)

func _on_fire_sub_gather_button_pressed():
	add_sub_element(r_clicker, list.RES.FIRE)

func _on_water_sub_gather_button_pressed():
	add_sub_element(r_clicker, list.RES.WATER)