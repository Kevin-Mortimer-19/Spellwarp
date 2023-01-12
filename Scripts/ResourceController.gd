extends Node

onready var air_sub_label: Label = get_node("../Elements/Air/Subresource")
onready var earth_sub_label: Label = get_node("../Elements/Earth/Subresource")
onready var fire_sub_label: Label = get_node("../Elements/Fire/Subresource")
onready var water_sub_label: Label = get_node("../Elements/Water/Subresource")

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
	add_sub_air(r_clicker)

func add_sub_air(amount):
	air_sub_count += amount
	air_sub_label.text = "Cloud Puffs: %s" % air_sub_count

func _on_earth_sub_gather_button_pressed():
	add_sub_earth(r_clicker)

func add_sub_earth(amount):
	earth_sub_count += amount
	earth_sub_label.text = "Obsidian Chunks: %s" % earth_sub_count

func _on_fire_sub_gather_button_pressed():
	add_sub_fire(r_clicker)

func add_sub_fire(amount):
	fire_sub_count += amount
	fire_sub_label.text = "Glowing Roses: %s" % fire_sub_count

func _on_water_sub_gather_button_pressed():
	add_sub_water(r_clicker)

func add_sub_water(amount):
	water_sub_count += amount
	water_sub_label.text = "Coral Crystals %s" % water_sub_count