extends Control
var resource_creator = load("res://Scripts/ResourceCreator.gd")
var dim = load("res://Scripts/Dimension.gd")

onready var air_label: Label = $Elements/Air/Count
onready var earth_label: Label = $Elements/Earth/Count
onready var fire_label: Label = $Elements/Fire/Count
onready var water_label: Label = $Elements/Water/Count
onready var light_label: Label = $LightHBox/LightLabel

onready var Resource_Controller = $Resource_Controller
onready var Time_Until_End = $TimeUntilTheEnd
onready var Storage = StoredEnergy

var air_count: int = 0
var earth_count: int = 0
var fire_count: int = 0
var water_count: int = 0
var light_count: int = 0

var air_clicker = 1
var earth_clicker = 1
var fire_clicker = 1
var water_clicker = 1

var list = ResourceList

var rng = RandomNumberGenerator.new()

var current_dim = dim.new(1,1,1,1)

func _ready():
	rng.randomize()
	new_dimension()
	
	air_label.text = "Air: %s" % air_count
	earth_label.text = "Earth: %s" % earth_count
	fire_label.text = "Fire: %s" % fire_count
	water_label.text = "Water: %s" % water_count
	light_label.text = "Light: %s" % light_count
	
	if ResearchDB.prod_1():
		for r in get_tree().get_nodes_in_group("advanced"):
			r.visible = true

func _process(delta):
	pass

func add_element(amount, element):
	match element:
		list.RES.AIR, list.RES.SUBAIR:
			air_count = air_count + amount if air_count + amount >= 0 else 0
			air_label.text = "Air: %s" % air_count
		list.RES.EARTH, list.RES.SUBEARTH:
			earth_count = earth_count + amount if earth_count + amount >= 0 else 0
			earth_label.text = "Earth: %s" % earth_count
		list.RES.FIRE, list.RES.SUBFIRE:
			fire_count = fire_count + amount if fire_count + amount >= 0 else 0
			fire_label.text = "Fire: %s" % fire_count
		list.RES.WATER, list.RES.SUBWATER:
			water_count = water_count + amount if water_count + amount >= 0 else 0
			water_label.text = "Water: %s" % water_count
		list.RES.LIGHT:
			light_count = light_count + amount if light_count + amount >= 0 else 0
			light_label.text = "Light: %s" % light_count

func get_element(element):
	match element:
		list.RES.AIR, list.RES.SUBAIR:
			return air_count
		list.RES.EARTH, list.RES.SUBEARTH:
			return earth_count
		list.RES.FIRE, list.RES.SUBFIRE:
			return fire_count
		list.RES.WATER, list.RES.SUBWATER:
			return water_count
		list.RES.LIGHT:
			return light_count

func get_affinity(element):
	match element:
		list.RES.AIR, list.RES.SUBAIR:
			return air_clicker
		list.RES.EARTH, list.RES.SUBEARTH:
			return earth_clicker
		list.RES.FIRE, list.RES.SUBFIRE:
			return fire_clicker
		list.RES.WATER, list.RES.SUBWATER:
			return water_clicker

func _on_air_button_pressed():
	add_element(air_clicker, list.RES.AIR)
	SoundPlayer.play_sound(SoundPlayer.CLICK1)

func _on_earth_button_pressed():
	add_element(earth_clicker, list.RES.EARTH)
	SoundPlayer.play_sound(SoundPlayer.CLICK1)

func _on_fire_button_pressed():
	add_element(fire_clicker, list.RES.FIRE)
	SoundPlayer.play_sound(SoundPlayer.CLICK1)

func _on_water_button_pressed():
	add_element(water_clicker, list.RES.WATER)
	SoundPlayer.play_sound(SoundPlayer.CLICK1)

func _on_light_button_pressed():
	combine(1)

func combine(amount):
	if can_afford_light(amount):
		for x in range(0,4):
			add_element(-1 * amount, x)
		add_element(amount, list.RES.LIGHT)

func can_afford_light(amount):
	return true if air_count > 0 && earth_count > 0 && fire_count > 0 && water_count > 0 else false

func store_energy():
	Storage.update(air_count, earth_count, fire_count, water_count, light_count)

func new_dimension():
	air_clicker = rng.randi_range(1,5)
	earth_clicker = rng.randi_range(1,5)
	fire_clicker = rng.randi_range(1,5)
	water_clicker = rng.randi_range(1,5)
	current_dim = dim.new(air_clicker, earth_clicker, fire_clicker, water_clicker)
	Resource_Controller.resources(current_dim.get_resource_1(), current_dim.get_resource_2(), current_dim.get_resource_3())
	if ResearchDB.warp_1():
		add_element(-1 * air_count / 2, list.RES.AIR)
		add_element(-1 * earth_count / 2, list.RES.EARTH)
		add_element(-1 * fire_count / 2, list.RES.FIRE)
		add_element(-1 * water_count / 2, list.RES.WATER)
	else:
		add_element(-1 * air_count, list.RES.AIR)
		add_element(-1 * earth_count, list.RES.EARTH)
		add_element(-1 * fire_count, list.RES.FIRE)
		add_element(-1 * water_count, list.RES.WATER)

func _on_warp_button_pressed():
	Time_Until_End.reset()
	new_dimension()

func unlock_advanced():
	for r in get_tree().get_nodes_in_group("advanced"):
		r.visible = true
