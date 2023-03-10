extends Control

var Event = load("res://Scripts/MonsterEvent.gd")
onready var FightLabel = $Menu/Label
onready var FailButton = $Menu/CombatRow/FailButton
onready var ElementButton = $Menu/CombatRow/ElementButton
onready var LightButton = $Menu/LightRow/LightButton

onready var air_label: Label = $Elements/Air/Count
onready var earth_label: Label = $Elements/Earth/Count
onready var fire_label: Label = $Elements/Fire/Count
onready var water_label: Label = $Elements/Water/Count
onready var light_label: Label = $Elements/Light/Count
onready var fade = $SceneTransitionRect
onready var sprite = $Monster

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
	AirAttack = Event.new("The Monster leaps into the air and conjures a great hurricane that quickly encircles you!", ResourceList.RES.AIR, "Curl up in the fetal position!", "Conjure a wall of Earth to shield yourself from the winds!", "Blast free from the eye of the storm with a burst of primordial Light!")
	AirDefend = Event.new("The Monster leaps into the air, wreathing itself in a formidable, shielding windstorm!", ResourceList.RES.AIR, "Throw a tome at it feebly!", "Call forth a barrage of boulders to pierce the defensive gale!", "Blast through the howling winds with a burst of primordial Light!")
	air_events.append(AirAttack)
	air_events.append(AirDefend)
	
	EarthAttack = Event.new("The Monster smashes into the ground, causing the earth itself to quake in fear!", ResourceList.RES.EARTH, "Jump into the air!", "Wreathe yourself in magical Air and take flight!", "Suffuse the land itself with the Light of pure magic, steadying it against the quake!")
	EarthDefend = Event.new("The Monster digs into the ground, taking shelter amid walls of upturned mineral!", ResourceList.RES.EARTH, "Hurl an empty bottle at the rocks!", "Rip the boulders from the earth with a whirlwind of Air!", "Reduce the stony barrier to ash with a beam of Light!")
	earth_events.append(EarthAttack)
	earth_events.append(EarthDefend)
	
	FireAttack = Event.new("The Monster attacks, breathing a jet of smoldering fire towards you!", ResourceList.RES.FIRE, "Stop, drop, and roll!", "Quell the roaring flames, surrounding yourself in a torrent of Water!", "Snuff out the fires of darkness with a flare of Light!")
	FireDefend = Event.new("The Monster begins to glow, and the surrounding terrain melts and burns in the intense heat!", ResourceList.RES.FIRE, "Charge into the molten aura!", "Douse the conflagration with a downpour of freezing Water!", "Nullify the heat and restore the melted plane with a rippling wave of Light!")
	fire_events.append(FireAttack)
	fire_events.append(FireDefend)
	
	
	WaterAttack = Event.new("The Monster roars, summoning a mighty flood to wash away its foe!", ResourceList.RES.WATER, "Dive straight in!", "Vaporize the oncoming wall of surf with a broiling arc of Fire!", "Rend through the waves with rapid blasts of unyeilding Light!")
	WaterDefend = Event.new("The temperature drops suddenly as the Monster's fur takes on an icy sheen!", ResourceList.RES.WATER, "Punch through the frost!", "Melt through its frozen shields, and scorch the Monster with a roaring pillar of primordial Fire!", "Shatter the ice with a hammering barrage of superconcentrated Light!")
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
		sprite.hurt()
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
			var difference = StoredEnergy.earth - AIR
			if difference > 0:
				StoredEnergy.earth = difference
				SoundPlayer.play_sound(SoundPlayer.EARTHSPELL)
				next_turn(true)
			else:
				next_turn(false)
		ResourceList.RES.EARTH:
			var difference = StoredEnergy.air - EARTH
			if difference > 0:
				StoredEnergy.air = difference
				SoundPlayer.play_sound(SoundPlayer.AIRSPELL)
				next_turn(true)
			else:
				next_turn(false)
		ResourceList.RES.FIRE:
			var difference = StoredEnergy.water - FIRE
			if difference > 0:
				StoredEnergy.water = difference
				SoundPlayer.play_sound(SoundPlayer.WATERSPELL)
				next_turn(true)
			else:
				next_turn(false)
		ResourceList.RES.WATER:
			var difference = StoredEnergy.fire - WATER
			if difference > 0:
				StoredEnergy.fire = difference
				SoundPlayer.play_sound(SoundPlayer.FIRESPELL)
				next_turn(true)
			else:
				next_turn(false)

func _on_light_button_pressed():
	if final_turn:
		var difference = StoredEnergy.light - DARK
		if difference > 0:
			SoundPlayer.play_sound(SoundPlayer.LIGHTSPELL1)
			SoundPlayer.play_sound(SoundPlayer.LIGHTSPELL2)
			sprite.hurt()
			victory()
		else:
			game_over()
	else:
		match active_element:
			ResourceList.RES.AIR:
				var difference = StoredEnergy.light - AIR
				if difference > 0:
					StoredEnergy.light = difference
					SoundPlayer.play_sound(SoundPlayer.LIGHTSPELL1)
					SoundPlayer.play_sound(SoundPlayer.LIGHTSPELL2)
					next_turn(true)
				else:
					next_turn(false)
			ResourceList.RES.EARTH:
				var difference = StoredEnergy.light - EARTH
				if difference > 0:
					StoredEnergy.light = difference
					SoundPlayer.play_sound(SoundPlayer.LIGHTSPELL1)
					SoundPlayer.play_sound(SoundPlayer.LIGHTSPELL2)
					next_turn(true)
				else:
					next_turn(false)
			ResourceList.RES.FIRE:
				var difference = StoredEnergy.light - FIRE
				if difference > 0:
					StoredEnergy.light = difference
					SoundPlayer.play_sound(SoundPlayer.LIGHTSPELL1)
					SoundPlayer.play_sound(SoundPlayer.LIGHTSPELL2)
					next_turn(true)
				else:
					next_turn(false)
			ResourceList.RES.WATER:
				var difference = StoredEnergy.light - WATER
				if difference > 0:
					StoredEnergy.light = difference
					SoundPlayer.play_sound(SoundPlayer.LIGHTSPELL1)
					SoundPlayer.play_sound(SoundPlayer.LIGHTSPELL2)
					next_turn(true)
				else:
					next_turn(false)

func spell_check(button, research):
	if research:
		button.disabled = false
	else:
		button.disabled = true

func overwhelming_darkness():
	FightLabel.set_text("The Monster charges up a blast of overwhelming darkness!")
	ElementButton.visible = false
	FailButton.set_text("Cower in fear... across worlds and stars, has your promised end finally come?")
	LightButton.set_text("You won't back down... not this time. Power radiates from within you! The Monster's darkness is no match for your light!")

func game_over():
	SoundPlayer.play_sound(SoundPlayer.DEATH)
	SoundPlayer.play_sound(SoundPlayer.NEGATIVE)
	fade.transition_to("res://Scenes/GAMEOVER.tscn")

func victory():
	fade.transition_to("res://Scenes/Victory.tscn")

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
