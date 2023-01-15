extends Node

var resource_creator = load("res://Scripts/ResourceCreator.gd")
var list = ResourceList

onready var main = get_node("..")
onready var res = get_node("../Resource_Controller")

# Buttons and Timers are declared and assigned here

onready var air_button_1 = get_node("../TabContainer/Air/Passive1")
onready var air_timer_1 = get_node("../TabContainer/Air/Passive1/Timer")
onready var air_label_1 = get_node("../TabContainer/Air/Label1")
onready var air_button_2 = get_node("../TabContainer/Air/Passive2")
onready var air_timer_2 = get_node("../TabContainer/Air/Passive2/Timer")
onready var air_label_2 = get_node("../TabContainer/Air/Label2")

onready var earth_button_1 = get_node("../TabContainer/Earth/Passive1")
onready var earth_timer_1 = get_node("../TabContainer/Earth/Passive1/Timer")
onready var earth_label_1 = get_node("../TabContainer/Earth/Label1")
onready var earth_button_2 = get_node("../TabContainer/Earth/Passive2")
onready var earth_timer_2 = get_node("../TabContainer/Earth/Passive2/Timer")
onready var earth_label_2 = get_node("../TabContainer/Earth/Label2")

onready var fire_button_1 = get_node("../TabContainer/Fire/Passive1")
onready var fire_timer_1 = get_node("../TabContainer/Fire/Passive1/Timer")
onready var fire_label_1 = get_node("../TabContainer/Fire/Label1")
onready var fire_button_2 = get_node("../TabContainer/Fire/Passive2")
onready var fire_timer_2 = get_node("../TabContainer/Fire/Passive2/Timer")
onready var fire_label_2 = get_node("../TabContainer/Fire/Label2")

onready var water_button_1 = get_node("../TabContainer/Water/Passive1")
onready var water_timer_1 = get_node("../TabContainer/Water/Passive1/Timer")
onready var water_label_1 = get_node("../TabContainer/Water/Label1")
onready var water_button_2 = get_node("../TabContainer/Water/Passive2")
onready var water_timer_2 = get_node("../TabContainer/Water/Passive2/Timer")
onready var water_label_2 = get_node("../TabContainer/Water/Label2")

# Passive income objects and the arrays in which they are contained are declared here

var all_passives = []
var gremlins = []
var gremlin_research: bool = false

var air_passive_1: ResourceCreator
var air_passive_2 :ResourceCreator

var earth_passive_1: ResourceCreator
var earth_passive_2: ResourceCreator

var fire_passive_1: ResourceCreator
var fire_passive_2: ResourceCreator

var water_passive_1: ResourceCreator
var water_passive_2: ResourceCreator

var cost_label = " (Cost: %s)"

func _ready():
	if ResearchDB.prod_2():
		gremlin_research = true
	#
	# Passive income objects are defined here and placed into the correct arrays.
	# ARGUMENTS:
	# Base cost of the object
	# Amount paid out every time the timer activates
	# Length of the timer (in seconds)
	# Button, Timer, and Label reference variables
	# Object's name
	# Type of resource produced
	#
	air_passive_1 = resource_creator.new(25, 10, 10, air_button_1, air_timer_1, air_label_1, "Wing Gremlins", list.RES.SUBAIR)
	air_passive_2 = resource_creator.new(50, 1, 1, air_button_2, air_timer_2, air_label_2, "Puff Condenser", list.RES.AIR)
	
	all_passives.append(air_passive_1)
	all_passives.append(air_passive_2)
	
	earth_passive_1 = resource_creator.new(25, 10, 10, earth_button_1, earth_timer_1, earth_label_1, "Crag Gremlins", list.RES.SUBEARTH)
	earth_passive_2 = resource_creator.new(50, 1, 1, earth_button_2, earth_timer_2, earth_label_2, "Chunk Breaker", list.RES.EARTH)
	all_passives.append(earth_passive_1)
	all_passives.append(earth_passive_2)
	
	fire_passive_1 = resource_creator.new(25, 10, 10, fire_button_1, fire_timer_1, fire_label_1,  "Fireproof Gremlins", list.RES.SUBFIRE)
	fire_passive_2 = resource_creator.new(50, 1, 1, fire_button_2, fire_timer_2, fire_label_2, "Rose Mixer", list.RES.FIRE)
	all_passives.append(fire_passive_1)
	all_passives.append(fire_passive_2)
	
	water_passive_1 = resource_creator.new(25, 10, 10, water_button_1, water_timer_1, water_label_1, "Amphibious Gremlins", list.RES.SUBWATER)
	water_passive_2 = resource_creator.new(50, 1, 1, water_button_2, water_timer_2, water_label_2, "Crystal Crushers", list.RES.WATER)
	all_passives.append(water_passive_1)
	all_passives.append(water_passive_2)
	
	gremlins.append(air_passive_1)
	gremlins.append(earth_passive_1)
	gremlins.append(fire_passive_1)
	gremlins.append(water_passive_1)
	
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
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_air_passive1_timeout():
	res.add_sub_element(payout(air_passive_1), list.RES.SUBAIR)

func _on_air_passive2_pressed():
	buy_creator(air_passive_2)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_air_passive2_timeout():
	extraction(payout(air_passive_2), list.RES.SUBAIR)

# Earth

func _on_earth_passive1_pressed():
	buy_creator(earth_passive_1)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_earth_passive1_timeout():
	res.add_sub_element(payout(earth_passive_1), list.RES.SUBEARTH)

func _on_earth_passive2_pressed():
	buy_creator(earth_passive_2)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_earth_passive2_timeout():
	extraction(payout(earth_passive_2), list.RES.SUBEARTH)

# Fire

func _on_fire_passive1_pressed():
	buy_creator(fire_passive_1)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_fire_passive1_timeout():
	res.add_sub_element(payout(fire_passive_1), list.RES.SUBFIRE)

func _on_fire_passive2_pressed():
	buy_creator(fire_passive_2)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_fire_passive2_timeout():
	extraction(payout(fire_passive_2), list.RES.SUBFIRE)

# Water

func _on_water_passive1_pressed():
	buy_creator(water_passive_1)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_water_passive1_timeout():
	res.add_sub_element(payout(water_passive_1), list.RES.SUBWATER)

func _on_water_passive2_pressed():
	buy_creator(water_passive_2)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_water_passive2_timeout():
	extraction(payout(water_passive_2), list.RES.SUBWATER)

# Helper functions

func better_gremlins():
	for g in gremlins:
		g.get_timer().set_wait_time(g.get_timer().get_wait_time() / 2)

func buy_creator(creator):
	var cost = creator.buy()
	main.add_element(-1 * cost, creator.get_element())
	text_update(creator)

func extraction(amount, element):
	if res.can_afford(amount, element):
		res.add_sub_element(-1 * amount, element)
		if ResearchDB.prod_3():
			main.add_element(2 * amount * main.get_affinity(element), element)
		else:
			main.add_element(amount * main.get_affinity(element), element)

func payout(creator) -> int:
	return creator.get_output() * creator.get_amount()

func text_update(creator):
	var template = creator.get_name() + cost_label
	creator.get_button().text = template % creator.get_cost()
	if creator.amount > 0:
		template = "You own %s, which produce %s per second."
		creator.get_label().text = template % [creator.get_amount(), payout(creator) / creator.get_time()]

func reset():
	for p in all_passives:
		p.set_amount(0)
