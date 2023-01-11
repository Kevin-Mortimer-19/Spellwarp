extends Control
var resource_creator = load("res://Scripts/ResourceCreator.gd")
var dim = load("res://Scripts/Dimension.gd")

onready var bean_count: Label = $VBoxContainer/Label1

onready var bean_farmer_label: Label = $VBoxContainer/Label2
onready var bean_farmer_button = $VBoxContainer/Button2
onready var bean_farmer_timer: Timer = $VBoxContainer/Timer1

onready var air_label: Label = $Elements/Air/Count
onready var earth_label: Label = $Elements/Earth/Count
onready var fire_label: Label = $Elements/Fire/Count
onready var water_label: Label = $Elements/Water/Count

onready var Resource_Controller = $Resource_Controller

var air_count = 0
var earth_count = 0
var fire_count = 0
var water_count = 0

var air_clicker = 1
var earth_clicker = 1
var fire_clicker = 1
var water_clicker = 1

var air_sub_count = 0
var earth_sub_count = 0
var fire_sub_count = 0
var water_sub_count = 0

enum RESOURCES {AIR, EARTH, FIRE, WATER, LIGHT, NULL}

var rng = RandomNumberGenerator.new()

var count: int = 0 setget set_count, get_count

var clicker_add: int = 1

var bean_farmer_count := 0

var bean_farm = resource_creator.new(10, 1, 1.0)

var current_dim = dim.new(1,1,1,1)


func _ready():
	rng.randomize()
	new_dimension()
	
	bean_count.text = "bean count: %s" % count
	bean_farmer_label.text = "bean farmer count: %s" % bean_farmer_count
	bean_farmer_timer.wait_time = bean_farm.get_time()
	
	air_label.text = "Air: %s" % air_count
	earth_label.text = "Earth: %s" % earth_count
	fire_label.text = "Fire: %s" % fire_count
	water_label.text = "Water: %s" % water_count

func _process(delta):
	bean_farmer_button.disabled = get_count() < bean_farm.get_cost()
	
	if bean_farmer_count > 0:
		if bean_farmer_timer.is_stopped():
			bean_farmer_timer.start()

func set_count(value) -> void:
	count += value
	bean_count.text = "bean count: %s" % count

func get_count() -> int:
	return count

func _on_check_button_pressed():
	set_count(clicker_add)

func _on_buy_bean_farmer_button_pressed():
	set_count(-1 * abs(bean_farm.get_cost()))
	bean_farmer_count += 1
	bean_farm.set_cost(bean_farm.get_cost() + 10 * bean_farmer_count)
	bean_farmer_label.text = "bean farmer count: %s" % bean_farmer_count

func _on_air_button_pressed():
	add_air(air_clicker)

func add_air(amount):
	air_count += amount
	air_label.text = "Air: %s" % air_count

func _on_earth_button_pressed():
	add_earth(earth_clicker)

func add_earth(amount):
	earth_count += amount
	earth_label.text = "Earth: %s" % earth_count

func _on_fire_button_pressed():
	add_fire(fire_clicker)

func add_fire(amount):
	fire_count += amount
	fire_label.text = "Fire: %s" % fire_count

func _on_water_button_pressed():
	add_water(water_clicker)

func add_water(amount):
	water_count += amount
	water_label.text = "Water: %s" % water_count

func new_dimension():
	air_clicker = rng.randi_range(1,5)
	earth_clicker = rng.randi_range(1,5)
	fire_clicker = rng.randi_range(1,5)
	water_clicker = rng.randi_range(1,5)
	current_dim = dim.new(air_clicker, earth_clicker, fire_clicker, water_clicker)
	Resource_Controller.resources(current_dim.get_resource_1(), current_dim.get_resource_2())

func _on_bean_farmer_timer_timeout():
	set_count(bean_farmer_count * bean_farm.get_output())

func _on_warp_button_pressed():
	print("Warp!")
	new_dimension()
