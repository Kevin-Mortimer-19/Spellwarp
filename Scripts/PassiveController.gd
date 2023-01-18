extends Node

var resource_creator = load("res://Scripts/ResourceCreator.gd")
var list = ResourceList

onready var main = get_node("..")
onready var res = get_node("../Resource_Controller")

# Buttons and Timers are declared and assigned here

onready var air_button_0 = get_node("../TabContainer/Air/AirList/Passive0")
onready var air_timer_0 = get_node("../TabContainer/Air/AirList/Passive0/Timer")
onready var air_label_0 = get_node("../TabContainer/Air/AirList/Label0")
onready var air_button_1 = get_node("../TabContainer/Air/AirList/Passive1")
onready var air_timer_1 = get_node("../TabContainer/Air/AirList/Passive1/Timer")
onready var air_label_1 = get_node("../TabContainer/Air/AirList/Label1")
onready var air_button_2 = get_node("../TabContainer/Air/AirList/Passive2")
onready var air_timer_2 = get_node("../TabContainer/Air/AirList/Passive2/Timer")
onready var air_label_2 = get_node("../TabContainer/Air/AirList/Label2")
onready var air_button_3 = get_node("../TabContainer/Air/AirList/Passive3")
onready var air_timer_3 = get_node("../TabContainer/Air/AirList/Passive3/Timer")
onready var air_label_3 = get_node("../TabContainer/Air/AirList/Label3")
onready var air_button_4 = get_node("../TabContainer/Air/AirList/Passive4")
onready var air_timer_4 = get_node("../TabContainer/Air/AirList/Passive4/Timer")
onready var air_label_4 = get_node("../TabContainer/Air/AirList/Label4")
onready var air_button_5 = get_node("../TabContainer/Air/AirList/Passive5")
onready var air_timer_5 = get_node("../TabContainer/Air/AirList/Passive5/Timer")
onready var air_label_5 = get_node("../TabContainer/Air/AirList/Label5")
onready var air_button_6 = get_node("../TabContainer/Air/AirList/Passive6")
onready var air_timer_6 = get_node("../TabContainer/Air/AirList/Passive6/Timer")
onready var air_label_6 = get_node("../TabContainer/Air/AirList/Label6")
onready var air_button_7 = get_node("../TabContainer/Air/AirList/Passive7")
onready var air_timer_7 = get_node("../TabContainer/Air/AirList/Passive7/Timer")
onready var air_label_7 = get_node("../TabContainer/Air/AirList/Label7")
onready var air_button_8 = get_node("../TabContainer/Air/AirList/Passive8")
onready var air_timer_8 = get_node("../TabContainer/Air/AirList/Passive8/Timer")
onready var air_label_8 = get_node("../TabContainer/Air/AirList/Label8")

onready var earth_button_0 = get_node("../TabContainer/Earth/EarthList/Passive0")
onready var earth_timer_0 = get_node("../TabContainer/Earth/EarthList/Passive0/Timer")
onready var earth_label_0 = get_node("../TabContainer/Earth/EarthList/Label0")
onready var earth_button_1 = get_node("../TabContainer/Earth/EarthList/Passive1")
onready var earth_timer_1 = get_node("../TabContainer/Earth/EarthList/Passive1/Timer")
onready var earth_label_1 = get_node("../TabContainer/Earth/EarthList/Label1")
onready var earth_button_2 = get_node("../TabContainer/Earth/EarthList/Passive2")
onready var earth_timer_2 = get_node("../TabContainer/Earth/EarthList/Passive2/Timer")
onready var earth_label_2 = get_node("../TabContainer/Earth/EarthList/Label2")
onready var earth_button_3 = get_node("../TabContainer/Earth/EarthList/Passive3")
onready var earth_timer_3 = get_node("../TabContainer/Earth/EarthList/Passive3/Timer")
onready var earth_label_3 = get_node("../TabContainer/Earth/EarthList/Label3")
onready var earth_button_4 = get_node("../TabContainer/Earth/EarthList/Passive4")
onready var earth_timer_4 = get_node("../TabContainer/Earth/EarthList/Passive4/Timer")
onready var earth_label_4 = get_node("../TabContainer/Earth/EarthList/Label4")
onready var earth_button_5 = get_node("../TabContainer/Earth/EarthList/Passive5")
onready var earth_timer_5 = get_node("../TabContainer/Earth/EarthList/Passive5/Timer")
onready var earth_label_5 = get_node("../TabContainer/Earth/EarthList/Label5")
onready var earth_button_6 = get_node("../TabContainer/Earth/EarthList/Passive6")
onready var earth_timer_6 = get_node("../TabContainer/Earth/EarthList/Passive6/Timer")
onready var earth_label_6 = get_node("../TabContainer/Earth/EarthList/Label6")
onready var earth_button_7 = get_node("../TabContainer/Earth/EarthList/Passive7")
onready var earth_timer_7 = get_node("../TabContainer/Earth/EarthList/Passive7/Timer")
onready var earth_label_7 = get_node("../TabContainer/Earth/EarthList/Label7")
onready var earth_button_8 = get_node("../TabContainer/Earth/EarthList/Passive8")
onready var earth_timer_8 = get_node("../TabContainer/Earth/EarthList/Passive8/Timer")
onready var earth_label_8 = get_node("../TabContainer/Earth/EarthList/Label8")

onready var fire_button_0 = get_node("../TabContainer/Fire/FireList/Passive0")
onready var fire_timer_0 = get_node("../TabContainer/Fire/FireList/Passive0/Timer")
onready var fire_label_0 = get_node("../TabContainer/Fire/FireList/Label0")
onready var fire_button_1 = get_node("../TabContainer/Fire/FireList/Passive1")
onready var fire_timer_1 = get_node("../TabContainer/Fire/FireList/Passive1/Timer")
onready var fire_label_1 = get_node("../TabContainer/Fire/FireList/Label1")
onready var fire_button_2 = get_node("../TabContainer/Fire/FireList/Passive2")
onready var fire_timer_2 = get_node("../TabContainer/Fire/FireList/Passive2/Timer")
onready var fire_label_2 = get_node("../TabContainer/Fire/FireList/Label2")
onready var fire_button_3 = get_node("../TabContainer/Fire/FireList/Passive3")
onready var fire_timer_3 = get_node("../TabContainer/Fire/FireList/Passive3/Timer")
onready var fire_label_3 = get_node("../TabContainer/Fire/FireList/Label3")
onready var fire_button_4 = get_node("../TabContainer/Fire/FireList/Passive4")
onready var fire_timer_4 = get_node("../TabContainer/Fire/FireList/Passive4/Timer")
onready var fire_label_4 = get_node("../TabContainer/Fire/FireList/Label4")
onready var fire_button_5 = get_node("../TabContainer/Fire/FireList/Passive5")
onready var fire_timer_5 = get_node("../TabContainer/Fire/FireList/Passive5/Timer")
onready var fire_label_5 = get_node("../TabContainer/Fire/FireList/Label5")
onready var fire_button_6 = get_node("../TabContainer/Fire/FireList/Passive6")
onready var fire_timer_6 = get_node("../TabContainer/Fire/FireList/Passive6/Timer")
onready var fire_label_6 = get_node("../TabContainer/Fire/FireList/Label6")
onready var fire_button_7 = get_node("../TabContainer/Fire/FireList/Passive7")
onready var fire_timer_7 = get_node("../TabContainer/Fire/FireList/Passive7/Timer")
onready var fire_label_7 = get_node("../TabContainer/Fire/FireList/Label7")
onready var fire_button_8 = get_node("../TabContainer/Fire/FireList/Passive8")
onready var fire_timer_8 = get_node("../TabContainer/Fire/FireList/Passive8/Timer")
onready var fire_label_8 = get_node("../TabContainer/Fire/FireList/Label8")

onready var water_button_0 = get_node("../TabContainer/Water/WaterList/Passive0")
onready var water_timer_0 = get_node("../TabContainer/Water/WaterList/Passive0/Timer")
onready var water_label_0 = get_node("../TabContainer/Water/WaterList/Label0")
onready var water_button_1 = get_node("../TabContainer/Water/WaterList/Passive1")
onready var water_timer_1 = get_node("../TabContainer/Water/WaterList/Passive1/Timer")
onready var water_label_1 = get_node("../TabContainer/Water/WaterList/Label1")
onready var water_button_2 = get_node("../TabContainer/Water/WaterList/Passive2")
onready var water_timer_2 = get_node("../TabContainer/Water/WaterList/Passive2/Timer")
onready var water_label_2 = get_node("../TabContainer/Water/WaterList/Label2")
onready var water_button_3 = get_node("../TabContainer/Water/WaterList/Passive3")
onready var water_timer_3 = get_node("../TabContainer/Water/WaterList/Passive3/Timer")
onready var water_label_3 = get_node("../TabContainer/Water/WaterList/Label3")
onready var water_button_4 = get_node("../TabContainer/Water/WaterList/Passive4")
onready var water_timer_4 = get_node("../TabContainer/Water/WaterList/Passive4/Timer")
onready var water_label_4 = get_node("../TabContainer/Water/WaterList/Label4")
onready var water_button_5 = get_node("../TabContainer/Water/WaterList/Passive5")
onready var water_timer_5 = get_node("../TabContainer/Water/WaterList/Passive5/Timer")
onready var water_label_5 = get_node("../TabContainer/Water/WaterList/Label5")
onready var water_button_6 = get_node("../TabContainer/Water/WaterList/Passive6")
onready var water_timer_6 = get_node("../TabContainer/Water/WaterList/Passive6/Timer")
onready var water_label_6 = get_node("../TabContainer/Water/WaterList/Label6")
onready var water_button_7 = get_node("../TabContainer/Water/WaterList/Passive7")
onready var water_timer_7 = get_node("../TabContainer/Water/WaterList/Passive7/Timer")
onready var water_label_7 = get_node("../TabContainer/Water/WaterList/Label7")
onready var water_button_8 = get_node("../TabContainer/Water/WaterList/Passive8")
onready var water_timer_8 = get_node("../TabContainer/Water/WaterList/Passive8/Timer")
onready var water_label_8 = get_node("../TabContainer/Water/WaterList/Label8")

onready var light_button_1 = get_node("../TabContainer/Light/LightList/Passive1")
onready var light_timer_1 = get_node("../TabContainer/Light/LightList/Passive1/Timer")
onready var light_label_1 = get_node("../TabContainer/Light/LightList/Label1")

# Passive income objects and the arrays in which they are contained are declared here

var all_passives = []
var gremlins = []
var gremlin_research: bool = false

var air_passive_0 :ResourceCreator
var air_passive_1: ResourceCreator
var air_passive_2 :ResourceCreator
var air_passive_3: ResourceCreator
var air_passive_4 :ResourceCreator
var air_passive_5: ResourceCreator
var air_passive_6 :ResourceCreator
var air_passive_7: ResourceCreator
var air_passive_8 :ResourceCreator

var earth_passive_0: ResourceCreator
var earth_passive_1: ResourceCreator
var earth_passive_2: ResourceCreator
var earth_passive_3: ResourceCreator
var earth_passive_4: ResourceCreator
var earth_passive_5: ResourceCreator
var earth_passive_6: ResourceCreator
var earth_passive_7: ResourceCreator
var earth_passive_8: ResourceCreator

var fire_passive_0: ResourceCreator
var fire_passive_1: ResourceCreator
var fire_passive_2: ResourceCreator
var fire_passive_3: ResourceCreator
var fire_passive_4: ResourceCreator
var fire_passive_5: ResourceCreator
var fire_passive_6: ResourceCreator
var fire_passive_7: ResourceCreator
var fire_passive_8: ResourceCreator

var water_passive_0: ResourceCreator
var water_passive_1: ResourceCreator
var water_passive_2: ResourceCreator
var water_passive_3: ResourceCreator
var water_passive_4: ResourceCreator
var water_passive_5: ResourceCreator
var water_passive_6: ResourceCreator
var water_passive_7: ResourceCreator
var water_passive_8: ResourceCreator

var light_passive_1: ResourceCreator

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
	air_passive_0 = resource_creator.new(100, 1, 1, air_button_0, air_timer_0, air_label_0, "Air Auto Extractor", list.RES.AIR, "Construct a rudimentary machine to extract elemental energy from the plane automatically.")
	air_passive_1 = resource_creator.new(20, 10, 10, air_button_1, air_timer_1, air_label_1, "Hire Lightweight Gremlins", list.RES.SUBAIR)
	air_passive_2 = resource_creator.new(40, 1, 1, air_button_2, air_timer_2, air_label_2, "Construct Puff Condenser", list.RES.AIR)
	air_passive_3 = resource_creator.new(250, 100, 10, air_button_3, air_timer_3, air_label_3, "Hire Wing Gremlins", list.RES.SUBAIR)
	air_passive_4 = resource_creator.new(500, 10, 1, air_button_4, air_timer_4, air_label_4, "Construct Puff Zapper", list.RES.AIR)
	air_passive_5 = resource_creator.new(3000, 1000, 10, air_button_5, air_timer_5, air_label_5, "Hire Gravity Gremlins", list.RES.SUBAIR)
	air_passive_6 = resource_creator.new(6000, 100, 1, air_button_6, air_timer_6, air_label_6, "Construct Puff Swirler", list.RES.AIR)
	air_passive_7 = resource_creator.new(20000, 5000, 10, air_button_7, air_timer_7, air_label_7, "Hire Gravity Gremlins", list.RES.SUBAIR)
	air_passive_8 = resource_creator.new(40000, 500, 1, air_button_8, air_timer_8, air_label_8, "Construct Puff Accelerator", list.RES.AIR)
	
	
	all_passives.append(air_passive_0)
	all_passives.append(air_passive_1)
	all_passives.append(air_passive_2)
	all_passives.append(air_passive_3)
	all_passives.append(air_passive_4)
	all_passives.append(air_passive_5)
	all_passives.append(air_passive_6)
	all_passives.append(air_passive_7)
	all_passives.append(air_passive_8)
	

	earth_passive_0 = resource_creator.new(100, 1, 1, earth_button_0, earth_timer_0, earth_label_0, "Earth Auto Extractor", list.RES.EARTH, "Construct a rudimentary machine to extract elemental energy from the plane automatically.")
	earth_passive_1 = resource_creator.new(20, 10, 10, earth_button_1, earth_timer_1, earth_label_1, "Hire Mining Gremlins", list.RES.SUBEARTH)
	earth_passive_2 = resource_creator.new(40, 1, 1, earth_button_2, earth_timer_2, earth_label_2, "Construct Chunk Breaker", list.RES.EARTH)
	earth_passive_3 = resource_creator.new(250, 100, 10, earth_button_3, earth_timer_3, earth_label_3, "Hire Crag Gremlins", list.RES.SUBEARTH)
	earth_passive_4 = resource_creator.new(500, 10, 1, earth_button_4, earth_timer_4, earth_label_4, "Construct Chunk Grinder", list.RES.EARTH)
	earth_passive_5 = resource_creator.new(3000, 1000, 10, earth_button_5, earth_timer_5, earth_label_5, "Hire Tunnel Gremlins", list.RES.SUBEARTH)
	earth_passive_6 = resource_creator.new(6000, 100, 1, earth_button_6, earth_timer_6, earth_label_6, "Construct Chunk Smasher", list.RES.EARTH)
	earth_passive_7 = resource_creator.new(20000, 5000, 10, earth_button_7, earth_timer_7, earth_label_7, "Hire Mole Gremlins", list.RES.SUBEARTH)
	earth_passive_8 = resource_creator.new(40000, 500, 1, earth_button_8, earth_timer_8, earth_label_8, "Construct Chunk Driller", list.RES.EARTH)
	
	all_passives.append(earth_passive_0)
	all_passives.append(earth_passive_1)
	all_passives.append(earth_passive_2)
	all_passives.append(earth_passive_3)
	all_passives.append(earth_passive_4)
	all_passives.append(earth_passive_5)
	all_passives.append(earth_passive_6)
	all_passives.append(earth_passive_7)
	all_passives.append(earth_passive_8)
	
	fire_passive_0 = resource_creator.new(100, 1, 1, fire_button_0, fire_timer_0, fire_label_0, "Fire Auto Extractor", list.RES.FIRE, "Construct a rudimentary machine to extract elemental energy from the plane automatically.")
	fire_passive_1 = resource_creator.new(20, 10, 10, fire_button_1, fire_timer_1, fire_label_1,  "Hire Gathering Gremlins", list.RES.SUBFIRE)
	fire_passive_2 = resource_creator.new(40, 1, 1, fire_button_2, fire_timer_2, fire_label_2, "Construct Rose Mixer", list.RES.FIRE)
	fire_passive_3 = resource_creator.new(250, 100, 10, fire_button_3, fire_timer_3, fire_label_3,  "Hire Thorny Gremlins", list.RES.SUBFIRE)
	fire_passive_4 = resource_creator.new(500, 10, 1, fire_button_4, fire_timer_4, fire_label_4, "Construct Rose Centrifuge", list.RES.FIRE)
	fire_passive_5 = resource_creator.new(3000, 1000, 10, fire_button_5, fire_timer_5, fire_label_5,  "Hire Fireproof Gremlins", list.RES.SUBFIRE)
	fire_passive_6 = resource_creator.new(6000, 100, 1, fire_button_6, fire_timer_6, fire_label_6, "Construct Rose Liquifier", list.RES.FIRE)
	fire_passive_7 = resource_creator.new(20000, 5000, 10, fire_button_7, fire_timer_7, fire_label_7,  "Hire Lava Gremlins", list.RES.SUBFIRE)
	fire_passive_8 = resource_creator.new(40000, 500, 1, fire_button_8, fire_timer_8, fire_label_8, "Construct Rose Disintegrator", list.RES.FIRE)

	all_passives.append(fire_passive_0)
	all_passives.append(fire_passive_1)
	all_passives.append(fire_passive_2)
	all_passives.append(fire_passive_3)
	all_passives.append(fire_passive_4)
	all_passives.append(fire_passive_5)
	all_passives.append(fire_passive_6)
	all_passives.append(fire_passive_7)
	all_passives.append(fire_passive_8)
	
	water_passive_0 = resource_creator.new(100, 1, 1, water_button_0, water_timer_0, water_label_0, "Water Auto Extractor", list.RES.WATER, "Construct a rudimentary machine to extract elemental energy from the plane automatically.")
	water_passive_1 = resource_creator.new(20, 10, 10, water_button_1, water_timer_1, water_label_1, "Hire Snorkeling Gremlins", list.RES.SUBWATER)
	water_passive_2 = resource_creator.new(40, 1, 1, water_button_2, water_timer_2, water_label_2, "Construct Crystal Crushers", list.RES.WATER)
	water_passive_3 = resource_creator.new(250, 100, 10, water_button_3, water_timer_3, water_label_3, "Hire Fin Gremlins", list.RES.SUBWATER)
	water_passive_4 = resource_creator.new(500, 10, 1, water_button_4, water_timer_4, water_label_4, "Construct Crystal Pulverizer", list.RES.WATER)
	water_passive_5 = resource_creator.new(3000, 1000, 10, water_button_5, water_timer_5, water_label_5, "Hire Amphibious Gremlins", list.RES.SUBWATER)
	water_passive_6 = resource_creator.new(6000, 100, 1, water_button_6, water_timer_6, water_label_6, "Construct Crystal Drainer", list.RES.WATER)
	water_passive_7 = resource_creator.new(20000, 5000, 10, water_button_7, water_timer_7, water_label_7, "Hire Shark Gremlins", list.RES.SUBWATER)
	water_passive_8 = resource_creator.new(40000, 500, 1, water_button_8, water_timer_8, water_label_8, "Construct Crystal Refinery", list.RES.WATER)
  
	all_passives.append(water_passive_0)
	all_passives.append(water_passive_1)
	all_passives.append(water_passive_2)
	all_passives.append(water_passive_3)
	all_passives.append(water_passive_4)
	all_passives.append(water_passive_5)
	all_passives.append(water_passive_6)
	all_passives.append(water_passive_7)
	all_passives.append(water_passive_8)
	
	light_passive_1 = resource_creator.new(50, 1, 1, light_button_1, light_timer_1, light_label_1, "Prism Altar", list.RES.LIGHT, "Construct an apparatus to refract elements into light automatically.")
	
	all_passives.append(light_passive_1)
	
	gremlins.append(air_passive_1)
	gremlins.append(air_passive_3)
	gremlins.append(air_passive_5)
	gremlins.append(air_passive_7)
	gremlins.append(earth_passive_1)
	gremlins.append(earth_passive_3)
	gremlins.append(earth_passive_5)
	gremlins.append(earth_passive_7)
	gremlins.append(fire_passive_1)
	gremlins.append(fire_passive_3)
	gremlins.append(fire_passive_5)
	gremlins.append(fire_passive_7)
	gremlins.append(water_passive_1)
	gremlins.append(water_passive_3)
	gremlins.append(water_passive_5)
	gremlins.append(water_passive_7)
	
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

func _on_air_passive0_pressed():
	buy_creator(air_passive_0)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_air_passive0_timeout():
	auto_channel(payout(air_passive_0), list.RES.AIR)

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

func _on_air_passive3_pressed():
	buy_creator(air_passive_3)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_air_passive3_timeout():
	res.add_sub_element(payout(air_passive_3), list.RES.SUBAIR)

func _on_air_passive4_pressed():
	buy_creator(air_passive_4)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_air_passive4_timeout():
	extraction(payout(air_passive_4), list.RES.SUBAIR)

func _on_air_passive5_pressed():
	buy_creator(air_passive_5)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_air_passive5_timeout():
	res.add_sub_element(payout(air_passive_5), list.RES.SUBAIR)

func _on_air_passive6_pressed():
	buy_creator(air_passive_6)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_air_passive6_timeout():
	extraction(payout(air_passive_6), list.RES.SUBAIR)

func _on_air_passive7_pressed():
	buy_creator(air_passive_7)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_air_passive7_timeout():
	res.add_sub_element(payout(air_passive_7), list.RES.SUBAIR)

func _on_air_passive8_pressed():
	buy_creator(air_passive_8)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_air_passive8_timeout():
	extraction(payout(air_passive_8), list.RES.SUBAIR)

# Earth

func _on_earth_passive0_pressed():
	buy_creator(earth_passive_0)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_earth_passive0_timeout():
	auto_channel(payout(earth_passive_0), list.RES.EARTH)

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
	
func _on_earth_passive3_pressed():
	buy_creator(earth_passive_3)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_earth_passive3_timeout():
	res.add_sub_element(payout(earth_passive_3), list.RES.SUBEARTH)

func _on_earth_passive4_pressed():
	buy_creator(earth_passive_4)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_earth_passive4_timeout():
	extraction(payout(earth_passive_4), list.RES.SUBEARTH)

func _on_earth_passive5_pressed():
	buy_creator(earth_passive_5)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_earth_passive5_timeout():
	res.add_sub_element(payout(earth_passive_5), list.RES.SUBEARTH)

func _on_earth_passive6_pressed():
	buy_creator(earth_passive_6)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_earth_passive6_timeout():
	extraction(payout(earth_passive_6), list.RES.SUBEARTH)
	
func _on_earth_passive7_pressed():
	buy_creator(earth_passive_7)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_earth_passive7_timeout():
	res.add_sub_element(payout(earth_passive_7), list.RES.SUBEARTH)

func _on_earth_passive8_pressed():
	buy_creator(earth_passive_8)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_earth_passive8_timeout():
	extraction(payout(earth_passive_8), list.RES.SUBEARTH)

# Fire

func _on_fire_passive0_pressed():
	buy_creator(fire_passive_0)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_fire_passive0_timeout():
	auto_channel(payout(fire_passive_0), list.RES.SUBFIRE)

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
	
func _on_fire_passive3_pressed():
	buy_creator(fire_passive_3)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_fire_passive3_timeout():
	res.add_sub_element(payout(fire_passive_3), list.RES.SUBFIRE)

func _on_fire_passive4_pressed():
	buy_creator(fire_passive_4)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_fire_passive4_timeout():
	extraction(payout(fire_passive_4), list.RES.SUBFIRE)

func _on_fire_passive5_pressed():
	buy_creator(fire_passive_5)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_fire_passive5_timeout():
	res.add_sub_element(payout(fire_passive_5), list.RES.SUBFIRE)

func _on_fire_passive6_pressed():
	buy_creator(fire_passive_6)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_fire_passive6_timeout():
	extraction(payout(fire_passive_6), list.RES.SUBFIRE)
	
func _on_fire_passive7_pressed():
	buy_creator(fire_passive_7)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_fire_passive7_timeout():
	res.add_sub_element(payout(fire_passive_7), list.RES.SUBFIRE)

func _on_fire_passive8_pressed():
	buy_creator(fire_passive_8)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_fire_passive8_timeout():
	extraction(payout(fire_passive_8), list.RES.SUBFIRE)

# Water

func _on_water_passive0_pressed():
	buy_creator(water_passive_0)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_water_passive0_timeout():
	auto_channel(payout(water_passive_0), list.RES.WATER)

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

func _on_water_passive3_pressed():
	buy_creator(water_passive_3)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_water_passive3_timeout():
	res.add_sub_element(payout(water_passive_3), list.RES.SUBWATER)

func _on_water_passive4_pressed():
	buy_creator(water_passive_4)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_water_passive4_timeout():
	extraction(payout(water_passive_4), list.RES.SUBWATER)

func _on_water_passive5_pressed():
	buy_creator(water_passive_5)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_water_passive5_timeout():
	res.add_sub_element(payout(water_passive_5), list.RES.SUBWATER)

func _on_water_passive6_pressed():
	buy_creator(water_passive_6)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_water_passive6_timeout():
	extraction(payout(water_passive_6), list.RES.SUBWATER)

func _on_water_passive7_pressed():
	buy_creator(water_passive_7)
	SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func _on_water_passive7_timeout():
	res.add_sub_element(payout(water_passive_7), list.RES.SUBWATER)

func _on_water_passive8_pressed():
	buy_creator(water_passive_8)
	SoundPlayer.play_sound(SoundPlayer.CLICK2)

func _on_water_passive8_timeout():
	extraction(payout(water_passive_8), list.RES.SUBWATER)

# Light

func _on_light_passive1_pressed():
	buy_creator(light_passive_1)
	SoundPlayer.play_category(SoundPlayer.LIGHTSOUNDS)

func _on_light_passive1_timeout():
	main.combine(payout(light_passive_1))

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

func auto_channel(amount, element):
	if ResearchDB.prod_3():
		main.add_element(2 * amount, element)
	else:
		main.add_element(amount, element)

func payout(creator) -> int:
	return creator.get_output() * creator.get_amount()

func text_update(creator):
	var template = creator.get_name() + cost_label
	creator.get_button().text = template % creator.get_cost()
	if creator.amount > 0:
		template = "You own %s, which produce %s per second."
		creator.get_label().text = template % [creator.get_amount(), payout(creator) / creator.get_time()]
	else:
		creator.get_label().text = ""

func reset():
	for p in all_passives:
		p.set_amount(0)
		p.reset_cost()
		text_update(p)
