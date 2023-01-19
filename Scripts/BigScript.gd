extends Control
var resource_creator = load("res://Scripts/ResourceCreator.gd")
var dim = load("res://Scripts/Dimension.gd")
var air_bg = load("res://Art/air_bg.png")
var earth_bg = load("res://Art/earth_bg.png")
var fire_bg = load("res://Art/fire_bg.png")
var water_bg = load("res://Art/water_bg.png")

onready var air_label: Label = $Elements/Air/Count
onready var earth_label: Label = $Elements/Earth/Count
onready var fire_label: Label = $Elements/Fire/Count
onready var water_label: Label = $Elements/Water/Count
onready var light_label: Label = $Elements/Light/Count

onready var Resource_Controller = $Resource_Controller
onready var Passive_Controller = $PassiveController
onready var Time_Until_End = $TimeUntilTheEnd
onready var Warp_Button = $WARP_SPEED
onready var Warp_Timer = $WARP_SPEED/Timer
onready var Warp_Label = $WARP_SPEED/Label
onready var LogBox = $LogBox
onready var Background = $UI/Background
onready var BGSideLine = $UI/Line1
onready var BGBottomLine = $UI/Line2

onready var Storage = StoredEnergy

var air_count: int = 0
var earth_count: int = 0
var fire_count: int = 0
var water_count: int = 0
var light_count: int = 0

var warp_count: int = 0

var air_clicker = 1
var earth_clicker = 1
var fire_clicker = 1
var water_clicker = 1

var warp_cost: int
var warp_ready: bool = false

var list = ResourceList

var rng = RandomNumberGenerator.new()

var current_dim = dim.new(1,1,1,1)

func _ready():
	if !Monster.initialized:
		monster_stats()
	warp_count = StoredEnergy.warp
	if Warp_Timer.is_stopped():
		Warp_Timer.start()
	rng.randomize()
	new_dimension()
	
	air_count = StoredEnergy.air
	earth_count = StoredEnergy.earth
	fire_count = StoredEnergy.fire
	water_count = StoredEnergy.water
	light_count = StoredEnergy.light
	
	warp_cost += warp_cost_change()
	if warp_cost == 0:
		warp_cost = 1
	
	Warp_Label.text = "Cost to warp:\n" + str(warp_cost) + " Light"
	
	dimension_attributes(current_dim.get_resource_1())
	
	ElementUI.display_element(air_label, "Air: %s", air_count)
	ElementUI.display_element(earth_label, "Earth: %s", earth_count)
	ElementUI.display_element(fire_label, "Fire: %s", fire_count)
	ElementUI.display_element(water_label, "Water: %s", water_count)
	ElementUI.display_element(light_label, "Light: %s", light_count)
	
	if ResearchDB.prod_1():
		unlock_advanced()
		Resource_Controller.enable_auto_extractors()

func _process(_delta):
	if light_count < warp_cost || !warp_ready: 
		Warp_Button.disabled = true
	else:
		Warp_Button.disabled = false

func monster_stats():
	var not_affinity = rng.randi_range(0,3)
	var arr = [list.RES.AIR, list.RES.EARTH, list.RES.FIRE, list.RES.WATER]
	var affinity_arr = []
	for a in arr:
		if a != not_affinity:
			affinity_arr.append(a)
	Monster.affinity1 = affinity_arr[0]
	Monster.affinity2 = affinity_arr[1]
	Monster.affinity3 = affinity_arr[2]
	
	Monster.initialized = true

func add_element(amount, element):
	match element:
		list.RES.AIR, list.RES.SUBAIR:
			air_count = air_count + amount if air_count + amount >= 0 else 0
			ElementUI.display_element(air_label, "Air: %s", air_count)
		list.RES.EARTH, list.RES.SUBEARTH:
			earth_count = earth_count + amount if earth_count + amount >= 0 else 0
			ElementUI.display_element(earth_label, "Earth: %s", earth_count)
		list.RES.FIRE, list.RES.SUBFIRE:
			fire_count = fire_count + amount if fire_count + amount >= 0 else 0
			ElementUI.display_element(fire_label, "Fire: %s", fire_count)
		list.RES.WATER, list.RES.SUBWATER:
			water_count = water_count + amount if water_count + amount >= 0 else 0
			ElementUI.display_element(water_label, "Water: %s", water_count)
		list.RES.LIGHT:
			light_count = light_count + amount if light_count + amount >= 0 else 0
			ElementUI.display_element(light_label, "Light: %s", light_count)

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
	SoundPlayer.play_category(SoundPlayer.BOOPSOUNDS)

func _on_earth_button_pressed():
	add_element(earth_clicker, list.RES.EARTH)
	SoundPlayer.play_category(SoundPlayer.BOOPSOUNDS)

func _on_fire_button_pressed():
	add_element(fire_clicker, list.RES.FIRE)
	SoundPlayer.play_category(SoundPlayer.BOOPSOUNDS)

func _on_water_button_pressed():
	add_element(water_clicker, list.RES.WATER)
	SoundPlayer.play_category(SoundPlayer.BOOPSOUNDS)

func _on_light_button_pressed():
	combine(1)
	if can_afford_light(1):
		SoundPlayer.play_category(SoundPlayer.LIGHTSOUNDS)
	else: 
		SoundPlayer.play_category(SoundPlayer.GREMLINSOUNDS)

func combine(amount):
	if can_afford_light(amount):
		for x in range(0,4):
			add_element(-1 * amount, x)
		add_element(amount, list.RES.LIGHT)

func can_afford_light(amount):
	return true if air_count >= amount && earth_count >= amount && fire_count >= amount && water_count >= amount else false

func dimension_attributes(resource):
	match resource:
		list.RES.AIR, list.RES.SUBAIR:
			LogBox.set_text("You land on a world whose winds dance across the skies like children at play.")
			SoundPlayer.play_ost(SoundPlayer.AIRSONG)
			Background.set_texture(air_bg)
		list.RES.EARTH, list.RES.SUBEARTH:
			LogBox.set_text("You land on a world whose mysterious caves hide an ancient and glorious history.")
			SoundPlayer.play_ost(SoundPlayer.EARTHSONG)
			Background.set_texture(earth_bg)
		list.RES.FIRE, list.RES.SUBFIRE:
			LogBox.set_text("You land on a world consumed by fire and magma, passion and rage.")
			SoundPlayer.play_ost(SoundPlayer.FIRESONG)
			Background.set_texture(fire_bg)
		list.RES.WATER, list.RES.SUBWATER:
			LogBox.set_text("You land in a vast ocean, whose dark depths are at once calming and ominous.")
			SoundPlayer.play_ost(SoundPlayer.WATERSONG)
			Background.set_texture(water_bg)
	draw_ui()

func draw_ui():
	var scale_factor = 0.18
	var img_height = 2100
	var img_width = 1500
	Background.set_scale(Vector2(scale_factor, scale_factor))
	
	BGSideLine.add_point(Vector2(img_width * scale_factor + BGSideLine.width/2, 0))
	BGSideLine.add_point(Vector2(img_width * scale_factor + BGSideLine.width/2, img_height * scale_factor + BGSideLine.width/2))
	BGSideLine.add_point(Vector2(0, img_height * scale_factor + BGSideLine.width/2))
	BGSideLine.add_point(Vector2(img_width * scale_factor + BGSideLine.width/2, img_height * scale_factor + BGSideLine.width/2))


func store_energy():
	Storage.update(air_count, earth_count, fire_count, water_count, light_count, warp_count)

func new_dimension():
	warp_count += 1
	Resource_Controller.wipe()
	Passive_Controller.reset()
	air_clicker = rng.randi_range(1,5)
	earth_clicker = rng.randi_range(1,5)
	fire_clicker = rng.randi_range(1,5)
	water_clicker = rng.randi_range(1,5)
	current_dim = dim.new(air_clicker, earth_clicker, fire_clicker, water_clicker)
	dimension_attributes(current_dim.get_resource_1())
	Resource_Controller.resources(current_dim.get_resource_1(), current_dim.get_resource_2(), current_dim.get_resource_3())
	advanced_check()
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

func warp_cost_change() -> int:
	var delta = int(warp_count * warp_count * log(warp_count))
	return delta if delta > 0 else 1

func warp():
	warp_cost += warp_cost_change()
	Warp_Label.text = "Cost to warp:\n" + str(warp_cost) + " Light"
	Time_Until_End.reset()
	new_dimension()
	if Warp_Timer.is_stopped():
		Warp_Timer.start()
	warp_ready = false

func _on_warp_button_pressed():
	if light_count >= warp_cost:
		add_element(-1 * warp_cost, list.RES.LIGHT)
		warp()

func _on_warp_timer_timeout():
	warp_ready = true

func advanced_check():
	if ResearchDB.prod_1():
		unlock_advanced()
	else:
		lock_advanced()

func unlock_advanced():
	Resource_Controller.research_unlock(current_dim.get_resource_1(), current_dim.get_resource_2(), current_dim.get_resource_3())
	Passive_Controller.advanced_light()

func lock_advanced():
	for r in get_tree().get_nodes_in_group("advanced"):
		r.visible = false

func _on_TabContainer_tab_changed(tab):
	SoundPlayer.play_category(SoundPlayer.PAGETURNSOUNDS)
