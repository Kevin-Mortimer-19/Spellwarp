class_name Dimension extends Node

var air_a = 0
var earth_a = 0
var fire_a = 0
var water_a = 0

var list = ResourceList

var resource_1 = -1
var resource_2 = -1

func _init(a, e, f, w):
	air_a = a
	earth_a = e
	fire_a = f
	water_a = w
	if a == e && e == f && f == w :
		resource_1 = list.RES.LIGHT
		resource_2 = list.RES.NULL
	else:
		var arr = [a, e, f, w]
		var tempmax = 0
		var max_1_location = 0
		for i in range(arr.size()):
			if arr[i] > tempmax:
				tempmax = arr[i]
				max_1_location = i
		resource_1 = max_1_location
		
		var max_2_location = 1
		tempmax = 0
		for i in range(arr.size()):
			if arr[i] > tempmax && i != max_1_location:
				tempmax = arr[i]
				max_2_location = i
		resource_2 = max_2_location


func get_air():
	return air_a

func get_earth():
	return earth_a

func get_fire():
	return fire_a

func get_water():
	return water_a

func get_resource_1():
	return resource_1

func get_resource_2():
	return resource_2
