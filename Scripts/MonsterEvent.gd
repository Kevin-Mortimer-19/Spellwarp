class_name MonsterEvent extends Node

var desc: String

var element: int

var fail_button: String
var element_button: String
var light_button: String

func _init(d, e, fb, eb, lb):
	desc = d
	element = e
	fail_button = fb
	element_button = eb
	light_button = lb

func get_desc():
	return desc

func get_element():
	return element

func get_fail_button() -> String:
	return fail_button

func get_element_button() -> String:
	return element_button

func get_light_button() -> String:
	return light_button	
