class_name ResourceCreator extends Node

# The current cost of the resource creator, accounting for how many have been purchased already
var cost: int = 0
# The amount of resources created by each instance
var output: int = 0
# The time it takes for each instance to create resources
var time: float = 0.0

func _init(c, o, t):
	cost = c
	output = o
	time = t

func get_cost() -> int:
	return cost

func set_cost(c):
	cost = c

func get_output() -> int:
	return output

func get_time() -> float:
	return time