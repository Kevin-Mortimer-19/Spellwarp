extends Node

# sounds
const CLICK1 = preload("res://Sounds/SFX/click1.mp3")
const CLICK2 = preload("res://Sounds/SFX/click2.mp3")
const GREMLIN1 = preload("res://Sounds/SFX/gremlin1.wav")
const GREMLIN2 = preload("res://Sounds/SFX/gremlin2.wav")
const GREMLIN3 = preload("res://Sounds/SFX/gremlin3.wav")
const GREMLIN4 = preload("res://Sounds/SFX/gremlin4.wav")

# categories
var GREMLINSOUNDS = [GREMLIN1, GREMLIN2, GREMLIN3, GREMLIN4]

onready var audioPlayers: = $AudioPlayers

func play_sound(sound):
	for audioStreamPlayer in audioPlayers.get_children():
		if not audioStreamPlayer.playing:
			audioStreamPlayer.stream = sound
			audioStreamPlayer.play()
			break

func play_category(category):
	var randomSound = category[randi() % category.size()]
	play_sound(randomSound)
