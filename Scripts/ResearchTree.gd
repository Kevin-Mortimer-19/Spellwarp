extends VBoxContainer

var research_option = load("res://Scripts/ResearchOption.gd")

onready var main = get_node("..")

onready var warp1_b = $Warp1
onready var warp2_b = $Warp2
onready var warp3_b = $Warp3

onready var spell1_b = $Spell1
onready var spell2_b = $Spell2
onready var spell3_b = $Spell3

onready var prod1_b = $Production1
onready var prod2_b = $Production2
onready var prod3_b = $Production3

var warp1: ResearchOption
var warp2: ResearchOption
var warp3: ResearchOption

var spell1: ResearchOption
var spell2: ResearchOption
var spell3: ResearchOption

var prod1: ResearchOption
var prod2: ResearchOption
var prod3: ResearchOption


var options = []

func _ready():
	warp1 = research_option.new("Efficient Warping", 50, warp1_b, null, null)
	warp2 = research_option.new("Distance Warping", 100, warp2_b, null, null)
	warp3 = research_option.new("Prosperous Warping", 100, warp3_b, warp1, warp2)
	
	spell1 = research_option.new("Offensive Spellcasting", 50, spell1_b, null, null)
	spell2 = research_option.new("Defensive Spellcasting", 50, spell2_b, null, null)
	spell3 = research_option.new("Efficient Spellcasting", 200, spell3_b, spell1, spell2)
	
	prod1 = research_option.new("Advanced Production", 10, prod1_b, null, null)
	prod2 = research_option.new("Speedy Gremlins", 100, prod2_b, prod1, null)
	prod3 = research_option.new("Powerful Extractors", 100, prod3_b, prod1, null)
	
	options.append(warp1)
	options.append(warp2)
	options.append(warp3)
	options.append(spell1)
	options.append(spell2)
	options.append(spell3)
	options.append(prod1)
	options.append(prod2)
	options.append(prod3)
	
	var template = "%s (Cost: %s)"
	for o in options:
		o.get_button().set_text(template % [o.get_name(), o.get_cost()])

func _process(delta):
	for o in options:
		o.get_button().disabled = main.get_element(ResourceList.RES.LIGHT) < o.get_cost()
		o.get_button().visible = !o.owned() && o.available()

func _on_warp1_pressed():
	buy_research(warp1)
	SoundPlayer.play_category(SoundPlayer.UNLOCKSOUNDS)

func _on_warp2_pressed():
	buy_research(warp2)
	SoundPlayer.play_category(SoundPlayer.UNLOCKSOUNDS)

func _on_warp3_pressed():
	buy_research(warp3)
	SoundPlayer.play_category(SoundPlayer.UNLOCKSOUNDS)

func _on_spell1_pressed():
	buy_research(spell1)
	SoundPlayer.play_category(SoundPlayer.UNLOCKSOUNDS)

func _on_spell2_pressed():
	buy_research(spell2)
	SoundPlayer.play_category(SoundPlayer.UNLOCKSOUNDS)

func _on_spell3_pressed():
	buy_research(spell3)
	SoundPlayer.play_category(SoundPlayer.UNLOCKSOUNDS)

func _on_prod1_pressed():
	buy_research(prod1)
	SoundPlayer.play_category(SoundPlayer.UNLOCKSOUNDS)

func _on_prod2_pressed():
	buy_research(prod2)
	SoundPlayer.play_category(SoundPlayer.UNLOCKSOUNDS)

func _on_prod3_pressed():
	buy_research(prod3)
	SoundPlayer.play_category(SoundPlayer.UNLOCKSOUNDS)

func buy_research(option):
	main.add_element(-1 * option.buy(), ResourceList.RES.LIGHT)

func save_research():
	pass
