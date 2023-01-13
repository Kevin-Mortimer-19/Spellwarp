extends Node

var resource_creator = load("res://Scripts/ResourceCreator.gd")
var list = ResourceList

onready var main = get_node("..")
onready var res = get_node("../Resource_Controller")

# Buttons and Timers are declared and assigned here

onready var air_button_1 = get_node("../TabContainer/Air/Passive1")
onready var air_timer_1 = get_node("../TabContainer/Air/Passive1/Timer")
onready var air_button_2 = get_node("../TabContainer/Air/Passive2")
onready var air_timer_2 = get_node("../TabContainer/Air/Passive2/Timer")
onready var air_button_3 = get_node("../TabContainer/Air/Passive3")
onready var air_timer_3 = get_node("../TabContainer/Air/Passive3/Timer")

onready var earth_button_1 = get_node("../TabContainer/Earth/Passive1")
onready var earth_timer_1 = get_node("../TabContainer/Earth/Passive1/Timer")
onready var earth_button_2 = get_node("../TabContainer/Earth/Passive2")
onready var earth_timer_2 = get_node("../TabContainer/Earth/Passive2/Timer")

onready var fire_button_1 = get_node("../TabContainer/Fire/Passive1")
onready var fire_timer_1 = get_node("../TabContainer/Fire/Passive1/Timer")

onready var water_button_1 = get_node("../TabContainer/Water/Passive1")
onready var water_timer_1 = get_node("../TabContainer/Water/Passive1/Timer")

# Passive income objects and the arrays in which they are contained are declared here

var all_passives = []

var air_passive_1: ResourceCreator
var air_passive_2 :ResourceCreator
var air_passive_3 :ResourceCreator

var earth_passive_1: ResourceCreator
var earth_passive_2: ResourceCreator

var fire_passive_1: ResourceCreator

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
	air_passive_1 = resource_creator.new(10, 1, 1, air_button_1, air_timer_1, "Nimbus Farm", list.RES.AIR)
	air_passive_2 = resource_creator.new(100, 20, 2, air_button_2, air_timer_2, "Gravity Well", list.RES.AIR)
	air_passive_3 = resource_creator.new(10, 1, 1, air_button_3, air_timer_3, "Puff Condenser", list.RES.SUBAIR)
	all_passives.append(air_passive_1)
	all_passives.append(air_passive_2)
	all_passives.append(air_passive_3)
	
	earth_passive_1 = resource_creator.new(10, 1, 1, earth_button_1, earth_timer_1, "Rocky Caves", list.RES.EARTH)
	earth_passive_2 = resource_creator.new(10, 10, 10, earth_button_2, earth_timer_2, "Hire Gremlins", list.RES.EARTH)
	all_passives.append(earth_passive_1)
	all_passives.append(earth_passive_2)
	
	fire_passive_1 = resource_creator.new(10, 1, 1, fire_button_1, fire_timer_1, "Molten Harvester", list.RES.FIRE)
	all_passives.append(fire_passive_1)
	
	water_passive_1 = resource_creator.new(10, 1, 1, water_button_1, water_timer_1, "Water Off the Duck's Back", list.RES.WATER)
	all_passives.append(water_passive_1)
	
	# Initial button text setup
	for x in all_passives:
		text_update(x)

func _process(delta):
	active_buttons(all_passives)

func active_buttons(arr):
	for x in arr:
		x.get_button().disabled = main.get_element(x.get_element()) < x.get_cost()
		if x.get_amount() > 0:
			if x.get_timer().is_stopped():
				x.get_timer().start()

# Signal functions
# When the node (button or timer) emits a signal, these functions take the appropriate action

# Air

func _on_air_passive1_pressed():
	buy_creator(air_passive_1)

func _on_air_passive1_timeout():
	main.add_element(payout(air_passive_1), list.RES.AIR)

func _on_air_passive2_pressed():
	buy_creator(air_passive_2)

func _on_air_passive2_timeout():
	main.add_element(payout(air_passive_2), list.RES.AIR)

func _on_air_passive3_pressed():
	buy_creator(air_passive_3)

func _on_air_passive3_timeout():
	extraction(payout(air_passive_3), list.RES.SUBAIR)

# Earth

func _on_earth_passive1_pressed():
	buy_creator(earth_passive_1)

func _on_earth_passive1_timeout():
	main.add_element(payout(earth_passive_1), list.RES.EARTH)

func _on_earth_passive2_pressed():
	buy_creator(earth_passive_2)

func _on_earth_passive2_timeout():
	main.add_element(payout(earth_passive_2), list.RES.EARTH)

# Fire

func _on_fire_passive1_pressed():
	buy_creator(fire_passive_1)

func _on_fire_passive1_timeout():
	main.add_element(payout(fire_passive_1), list.RES.FIRE)

# Water

func _on_water_passive1_pressed():
	buy_creator(water_passive_1)

func _on_water_passive1_timeout():
	main.add_element(payout(water_passive_1), list.RES.WATER)

# Helper functions

func buy_creator(creator):
	var cost = creator.buy()
	main.add_element(-1 * cost, creator.get_element())
	text_update(creator)

func extraction(amount, element):
	if res.can_afford(amount, element):
		res.add_sub_element(-1 * amount, element)
		main.add_element(amount * main.get_affinity(element), element)

func payout(creator) -> int:
	return creator.get_output() * creator.get_amount()

func text_update(creator):
	var template = creator.get_name() + cost_label
	creator.get_button().text = template % creator.get_cost()