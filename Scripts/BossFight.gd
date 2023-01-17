extends Control

var Event = load("res://Scripts/MonsterEvent.gd")
onready var FightLabel = $Menu/Label
onready var FailButton = $Menu/CombatRow/FailButton
onready var ElementButton = $Menu/CombatRow/ElementButton
onready var LightButton = $Menu/CombatRow/LightButton

#onready var AirLabel = $Elements/Air/Count
#onready var EarthLabel = $Elements/Earth/Count
#onready var FireLabel = $Elements/Fire/Count
#onready var WaterLabel = $Elements/Water/Count
#onready var LightLabel = $Elements/Light/Count

onready var air_label: Label = $Elements/Air/Count
onready var earth_label: Label = $Elements/Earth/Count
onready var fire_label: Label = $Elements/Fire/Count
onready var water_label: Label = $Elements/Water/Count
onready var light_label: Label = $Elements/Light/Count

var AirAttack: MonsterEvent
var AirDefend: MonsterEvent
var air_events = []
var EarthAttack: MonsterEvent
var EarthDefend: MonsterEvent
var earth_events = []
var FireAttack: MonsterEvent
var FireDefend: MonsterEvent
var fire_events = []
var WaterAttack: MonsterEvent
var WaterDefend: MonsterEvent
var water_events = []

var AIR: int
var EARTH: int
var FIRE: int
var WATER: int
var DARK: int

var active_element: int
var offense_mode: bool
var final_turn: bool = false

var turn_count: int

var rng = RandomNumberGenerator.new()

func _ready():
	SoundPlayer.play_ost(SoundPlayer.MONSTERSONG)
	if ResearchDB.spell_3():
		AIR = Monster.air / 2
		EARTH = Monster.earth / 2
		FIRE = Monster.fire / 2
		WATER = Monster.water / 2
		DARK = Monster.darkness / 2
	else:
		AIR = Monster.air
		EARTH = Monster.earth
		FIRE = Monster.fire
		WATER = Monster.water
		DARK = Monster.darkness

	rng.randomize()
	element_text_update()
	AirAttack = Event.new("The Monster leaps into the air and conjures a great hurricane that quickly encircles you!", ResourceList.RES.AIR, "Curl up in the fetal position!", "Rock shield!", "Light")
	AirDefend = Event.new("The Monster leaps into the air, wreathing itself in a formidable windstorm!", ResourceList.RES.AIR, "Throw a rock at it!", "Throw a big rock at it!", "Light")
	air_events.append(AirAttack)
	air_events.append(AirDefend)
	
	EarthAttack = Event.new("The Monster smashes into the ground, causing the earth itself to quake in fear!", ResourceList.RES.EARTH, "Jump!", "Fly!", "Light")
	EarthDefend = Event.new("The Monster digs into the ground, taking shelter amid walls of upturned mineral!", ResourceList.RES.EARTH, "Fail", "Air Cutter", "Light")
	earth_events.append(EarthAttack)
	earth_events.append(EarthDefend)
	
	FireAttack = Event.new("The Monster attacks, breathing a jet of smoldering fire towards you!", ResourceList.RES.FIRE, "Stop, drop, and roll!", "Doues the flames with water!", "Light")
	FireDefend = Event.new("The Monster begins to glow, and the surrounding terrain melts and burns in the intense heat!", ResourceList.RES.FIRE, "Charge through the flames!", "Douse the vortex with water!", "Light")
	fire_events.append(FireAttack)
	fire_events.append(FireDefend)
	
	
	WaterAttack = Event.new("The Monster roars, summoning a mighty flood to wash away its foe!", ResourceList.RES.WATER, "Dive in!", "Raise a wall of fire!", "Light")
	WaterDefend = Event.new("The temperature drops suddenly as the Monster's fur takes on an icy sheen!", ResourceList.RES.WATER, "Punch the ice!", "Melt the ice!", "Light")
	water_events.append(WaterAttack)
	water_events.append(WaterDefend)
	turn_count = 1
	battle_turn(get_event(Monster.affinity1))

func element_text_update():
	ElementUI.display_element(air_label, "Air: %s", StoredEnergy.air)
	ElementUI.display_element(earth_label, "Earth: %s", StoredEnergy.earth)
	ElementUI.display_element(fire_label, "Fire: %s", StoredEnergy.fire)
	ElementUI.display_element(water_label, "Water: %s", StoredEnergy.water)
	ElementUI.display_element(light_label, "Light: %s", StoredEnergy.light)

func next_turn(success):
	if success:
		print("SUCCESS")
		element_text_update()
		match turn_count:
			1:
				turn_count += 1
				SoundPlayer.play_ost(SoundPlayer.PLAYERSONG)
				battle_turn(get_event(Monster.affinity2))
			2:
				turn_count += 1
				battle_turn(get_event(Monster.affinity3))
			3:
				final_turn = true
				overwhelming_darkness()
	else:
		game_over()

func battle_turn(e):
	FightLabel.set_text(e.get_desc())
	FailButton.set_text(e.get_fail_button())
	ElementButton.set_text(e.get_element_button())
	if (!ResearchDB.spell_1() && !offense_mode) || (!ResearchDB.spell_2() && offense_mode):
		ElementButton.disabled = true
	else:
		ElementButton.disabled = false
	LightButton.set_text(e.get_light_button())

func _on_fail_button_pressed():
	game_over()

func _on_element_button_pressed():
	match active_element:
		ResourceList.RES.AIR:
			var difference = StoredEnergy.air - AIR
			if difference > 0:
				StoredEnergy.air = difference
				next_turn(true)
			else:
				next_turn(false)
		ResourceList.RES.EARTH:
			var difference = StoredEnergy.earth - EARTH
			if difference > 0:
				StoredEnergy.earth = difference
				next_turn(true)
			else:
				next_turn(false)
		ResourceList.RES.FIRE:
			var difference = StoredEnergy.fire - FIRE
			if difference > 0:
				StoredEnergy.fire = difference
				next_turn(true)
			else:
				next_turn(false)
		ResourceList.RES.WATER:
			var difference = StoredEnergy.water - WATER
			if difference > 0:
				StoredEnergy.water = difference
				next_turn(true)
			else:
				next_turn(false)

func _on_light_button_pressed():
	if final_turn:
		var difference = StoredEnergy.light - DARK
		if difference > 0:
			victory()
		else:
			game_over()
	else:
		match active_element:
			ResourceList.RES.AIR:
				var difference = StoredEnergy.light - AIR
				if difference > 0:
					StoredEnergy.light = difference
					next_turn(true)
				else:
					next_turn(false)
			ResourceList.RES.EARTH:
				var difference = StoredEnergy.light - EARTH
				if difference > 0:
					StoredEnergy.light = difference
					next_turn(true)
				else:
					next_turn(false)
			ResourceList.RES.FIRE:
				var difference = StoredEnergy.light - FIRE
				if difference > 0:
					StoredEnergy.light = difference
					next_turn(true)
				else:
					next_turn(false)
			ResourceList.RES.WATER:
				var difference = StoredEnergy.light - WATER
				if difference > 0:
					StoredEnergy.light = difference
					next_turn(true)
				else:
					next_turn(false)

func spell_check(button, research):
	if research:
		button.disabled = false
	else:
		button.disabled = true

func overwhelming_darkness():
	FightLabel.set_text("The monster charges up a blast of overwhelming darkness!")
	ElementButton.visible = false

func game_over():
	get_tree().change_scene("res://Scenes/GAMEOVER.tscn")

func victory():
	FightLabel.set_text("victory!")

func get_event(a):
	var index = rng.randi_range(0,1)
	active_element = a
	offense_mode = true if index == 0 else false
	match a:
		ResourceList.RES.AIR:
			return air_events[index]
		ResourceList.RES.EARTH:
			return earth_events[index]
		ResourceList.RES.FIRE:
			return fire_events[index]
		ResourceList.RES.WATER:
			return water_events[index]

func get_turn_count() -> int:
	return turn_count
