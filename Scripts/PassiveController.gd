extends Node

var resource_creator = load("res://Scripts/ResourceCreator.gd")

onready var main = get_node("..")

# Buttons and Timers are declared and assigned here

onready var air_button_1 = get_node("../TabContainer/Air/Passive1")
onready var air_timer_1 = get_node("../TabContainer/Air/Passive1/Timer")
onready var air_button_2 = get_node("../TabContainer/Air/Passive2")
onready var air_timer_2 = get_node("../TabContainer/Air/Passive2/Timer")

onready var earth_button_1 = get_node("../TabContainer/Earth/Passive1")
onready var earth_timer_1 = get_node("../TabContainer/Earth/Passive1/Timer")
onready var earth_button_2 = get_node("../TabContainer/Earth/Passive2")
onready var earth_timer_2 = get_node("../TabContainer/Earth/Passive2/Timer")

onready var fire_button_1 = get_node("../TabContainer/Fire/Passive1")
onready var fire_timer_1 = get_node("../TabContainer/Fire/Passive1/Timer")

onready var water_button_1 = get_node("../TabContainer/Water/Passive1")
onready var water_timer_1 = get_node("../TabContainer/Water/Passive1/Timer")

# Passive income objects and the arrays in which they are contained are declared here

var air_passives = []
var air_passive_1: ResourceCreator
var air_passive_2 :ResourceCreator

var earth_passives = []
var earth_passive_1: ResourceCreator
var earth_passive_2: ResourceCreator

var fire_passives = []
var fire_passive_1: ResourceCreator

var water_passives = []
var water_passive_1: ResourceCreator

var cost_label = " (Cost: %s)"

func _ready():
	#
	# Passive income objects are defined here and placed into the correct arrays.
	# ARGUMENTS:
	# Base cost of the object
	# Amount paid out every time the timer activates
	# Length of the timer (in seconds)
	# Button and Timer reference variables
	# Object's name
	#
	air_passive_1 = resource_creator.new(10, 1, 1, air_button_1, air_timer_1, "Nimbus Farm")
	air_passive_2 = resource_creator.new(100, 20, 2, air_button_2, air_timer_2, "Gravity Well")
	air_passives.append(air_passive_1)
	air_passives.append(air_passive_2)
	
	earth_passive_1 = resource_creator.new(10, 1, 1, earth_button_1, earth_timer_1, "Rocky Caves")
	earth_passives.append(earth_passive_1)
	earth_passive_2 = resource_creator.new(10, 10, 10, earth_button_2, earth_timer_2, "Hire Gremlins")
	earth_passives.append(earth_passive_2)
	
	fire_passive_1 = resource_creator.new(10, 1, 1, fire_button_1, fire_timer_1, "Molten Harvester")
	fire_passives.append(fire_passive_1)
	
	water_passive_1 = resource_creator.new(10, 1, 1, water_button_1, water_timer_1, "Water Off the Duck's Back")
	water_passives.append(water_passive_1)
	
	# Initial button text setup
	
	for a in air_passives:
		text_update(a)
	for e in earth_passives:
		text_update(e)
	for f in fire_passives:
		text_update(f)
	for w in water_passives:
		text_update(w)

func _process(delta):
	active_buttons(air_passives, main.get_air())
	active_buttons(earth_passives, main.get_earth())
	active_buttons(fire_passives, main.get_fire())
	active_buttons(water_passives, main.get_water())

func active_buttons(arr, amount):
	for x in arr:
		x.get_button().disabled = amount < x.get_cost()
		if x.get_amount() > 0:
			if x.get_timer().is_stopped():
				x.get_timer().start()

# Signal functions
# When the node (button or timer) emits a signal, these functions take the appropriate action

# Air

func _on_air_passive1_pressed():
	buy_air(air_passive_1)

func _on_air_passive1_timeout():
	main.add_air(payout(air_passive_1))

func _on_air_passive2_pressed():
	buy_air(air_passive_2)

func _on_air_passive2_timeout():
	main.add_air(payout(air_passive_2))

# Earth

func _on_earth_passive1_pressed():
	buy_earth(earth_passive_1)

func _on_earth_passive1_timeout():
	main.add_earth(payout(earth_passive_1))

func _on_earth_passive2_pressed():
	buy_earth(earth_passive_2)

func _on_earth_passive2_timeout():
	main.add_earth(payout(earth_passive_2))

# Fire

func _on_fire_passive1_pressed():
	buy_fire(fire_passive_1)

func _on_fire_passive1_timeout():
	main.add_fire(payout(fire_passive_1))

# Water

func _on_water_passive1_pressed():
	buy_water(water_passive_1)

func _on_water_passive1_timeout():
	main.add_water(payout(water_passive_1))

# Helper functions

func buy_air(creator):
	var cost = creator.buy()
	main.add_air(-1 * cost)
	text_update(creator)

func buy_earth(creator):
	var cost = creator.buy()
	main.add_earth(-1 * cost)
	text_update(creator)

func buy_fire(creator):
	var cost = creator.buy()
	main.add_fire(-1 * cost)
	text_update(creator)

func buy_water(creator):
	var cost = creator.buy()
	main.add_water(-1 * cost)
	text_update(creator)

func payout(creator) -> int:
	return creator.get_output() * creator.get_amount()

func text_update(creator):
	var template = creator.get_name() + cost_label
	creator.get_button().text = template % creator.get_cost()