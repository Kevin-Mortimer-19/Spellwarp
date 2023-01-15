extends Node

# sounds
const CLICK1 = preload("res://Sounds/SFX/click1.mp3")
const CLICK2 = preload("res://Sounds/SFX/click2.mp3")
const GREMLIN1 = preload("res://Sounds/SFX/gremlin1.wav")
const GREMLIN2 = preload("res://Sounds/SFX/gremlin2.wav")
const GREMLIN3 = preload("res://Sounds/SFX/gremlin3.wav")
const GREMLIN4 = preload("res://Sounds/SFX/gremlin4.wav")
const CLOUDPUFFS1 = preload("res://Sounds/SFX/cloudpuffs1.wav")
const CLOUDPUFFS2 = preload("res://Sounds/SFX/cloudpuffs2.wav")
const OBSIDIANCHUNKS1 = preload("res://Sounds/SFX/obsidianchunks1.wav")
const OBSIDIANCHUNKS2 = preload("res://Sounds/SFX/obsidianchunks2.wav")
const GLOWINGROSES1 = preload("res://Sounds/SFX/glowingroses1.wav")
const GLOWINGROSES2 = preload("res://Sounds/SFX/glowingroses2.wav")
const CORALCRYSTALS1 = preload("res://Sounds/SFX/coralcrystals1.wav")
const CORALCRYSTALS2 = preload("res://Sounds/SFX/coralcrystals2.wav")

# categories
var GREMLINSOUNDS = [GREMLIN1, GREMLIN2, GREMLIN3, GREMLIN4]
var CLOUDPUFFSOUNDS = [CLOUDPUFFS1, CLOUDPUFFS2]
var OBSIDIANCHUNKSOUNDS = [OBSIDIANCHUNKS1, OBSIDIANCHUNKS2]
var GLOWINGROSESOUNDS = [GLOWINGROSES1, GLOWINGROSES2]
var CORALCRYSTALSOUNDS = [CORALCRYSTALS1, CORALCRYSTALS2]

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
