extends Control
var resource_creator = load("res://Scripts/ResourceCreator.gd")
var dim = load("res://Scripts/Dimension.gd")

onready var air_label: Label = $Elements/Air/Count
onready var earth_label: Label = $Elements/Earth/Count
onready var fire_label: Label = $Elements/Fire/Count
onready var water_label: Label = $Elements/Water/Count

onready var Resource_Controller = $Resource_Controller

var air_count: int = 0 setget add_air, get_air
var earth_count: int = 0 setget add_earth, get_earth
var fire_count: int = 0 setget add_fire, get_fire
var water_count: int = 0 setget add_water, get_water

var air_clicker = 1
var earth_clicker = 1
var fire_clicker = 1
var water_clicker = 1

enum RESOURCES {AIR, EARTH, FIRE, WATER, LIGHT, NULL}

var rng = RandomNumberGenerator.new()

var current_dim = dim.new(1,1,1,1)

func _ready():
	rng.randomize()
	new_dimension()
	
	air_label.text = "Air: %s" % air_count
	earth_label.text = "Earth: %s" % earth_count
	fire_label.text = "Fire: %s" % fire_count
	water_label.text = "Water: %s" % water_count

func _process(delta):
	pass

func _on_air_button_pressed():
	add_air(air_clicker)

func add_air(amount):
	air_count += amount
	air_label.text = "Air: %s" % air_count

func get_air() -> int:
	return air_count

func _on_earth_button_pressed():
	add_earth(earth_clicker)

func add_earth(amount):
	earth_count += amount
	earth_label.text = "Earth: %s" % earth_count

func get_earth():
	return earth_count

func _on_fire_button_pressed():
	add_fire(fire_clicker)

func add_fire(amount):
	fire_count += amount
	fire_label.text = "Fire: %s" % fire_count

func get_fire():
	return fire_count

func _on_water_button_pressed():
	add_water(water_clicker)

func add_water(amount):
	water_count += amount
	water_label.text = "Water: %s" % water_count

func get_water():
	return water_count

func new_dimension():
	air_clicker = rng.randi_range(1,5)
	earth_clicker = rng.randi_range(1,5)
	fire_clicker = rng.randi_range(1,5)
	water_clicker = rng.randi_range(1,5)
	current_dim = dim.new(air_clicker, earth_clicker, fire_clicker, water_clicker)
	Resource_Controller.resources(current_dim.get_resource_1(), current_dim.get_resource_2())

func _on_warp_button_pressed():
	print("Warp!")
	new_dimension()

func _on_air_passive1_pressed():
	pass
