extends VBoxContainer

var research_option = load("res://Scripts/ResearchOption.gd")

onready var main = get_node("..")
onready var passive = get_node("../PassiveController")

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
	warp1 = research_option.new("Efficient Warping", 5, warp1_b, null, null)
	if ResearchDB.warp_1(): warp1.buy()
	warp2 = research_option.new("Distance Warping", 10, warp2_b, null, null)
	if ResearchDB.warp_2(): warp2.buy()
	warp3 = research_option.new("Prosperous Warping", 10, warp3_b, warp1, warp2)
	if ResearchDB.warp_3(): warp3.buy()
	
	spell1 = research_option.new("Offensive Spellcasting", 5, spell1_b, null, null)
	if ResearchDB.spell_1(): spell1.buy()
	spell2 = research_option.new("Defensive Spellcasting", 5, spell2_b, null, null)
	if ResearchDB.spell_2(): spell2.buy()
	spell3 = research_option.new("Efficient Spellcasting", 20, spell3_b, spell1, spell2)
	if ResearchDB.spell_3(): spell3.buy()
	
	prod1 = research_option.new("Advanced Production", 1, prod1_b, null, null)
	if ResearchDB.prod_1(): prod1.buy()
	prod2 = research_option.new("Speedy Gremlins", 10, prod2_b, prod1, null)
	if ResearchDB.prod_2(): prod2.buy()
	prod3 = research_option.new("Powerful Extractors", 10, prod3_b, prod1, null)
	if ResearchDB.prod_3(): prod3.buy()
	
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
	ResearchDB.set_warp_1()

func _on_warp2_pressed():
	buy_research(warp2)
	ResearchDB.set_warp_2()

func _on_warp3_pressed():
	buy_research(warp3)
	ResearchDB.set_warp_3()

func _on_spell1_pressed():
	buy_research(spell1)
	ResearchDB.set_spell_1()

func _on_spell2_pressed():
	buy_research(spell2)
	ResearchDB.set_spell_2()

func _on_spell3_pressed():
	buy_research(spell3)
	ResearchDB.set_spell_3()

func _on_prod1_pressed():
	buy_research(prod1)
	ResearchDB.set_prod_1()
	main.unlock_advanced()

func _on_prod2_pressed():
	buy_research(prod2)
	ResearchDB.set_prod_2()
	passive.better_gremlins()

func _on_prod3_pressed():
	buy_research(prod3)
	ResearchDB.set_prod_3()

func buy_research(option):
	main.add_element(-1 * option.buy(), ResourceList.RES.LIGHT)
