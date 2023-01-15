class_name ResearchOption extends Node

# The cost of the research option
var cost: int = 1
# Whether or not the research option is already owned (all options by default are not)
var bought: bool = false
# The resource creator's name
var r_name: String
# The button clicked to buy the research option
var button: Button
# Prerequisites (if any) before option can be purchased (if no prereqs, set both to null)
var prereq1: ResearchOption
var prereq2: ResearchOption

func _init(n, c, b, p1, p2):
	r_name = n
	cost = c
	button = b
	prereq1 = p1
	prereq2 = p2
	bought = false

func get_cost() -> int:
	return cost

func set_cost(c):
	cost = c

func get_button() -> Button:
	return button

func get_name() -> String:
	return r_name

func available() -> bool:
	if prereq1 == null:
		return true
	elif prereq1.owned() && prereq2 == null:
		return true
	elif prereq1.owned() && prereq2.owned():
		return true
	else:
		return false

func owned() -> bool:
	return bought

func buy() -> int:
	bought = true
	return cost
