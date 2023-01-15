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
const LIGHT1 = preload("res://Sounds/SFX/light1.wav")
const LIGHT2 = preload("res://Sounds/SFX/light2.wav")
const LIGHT3 = preload("res://Sounds/SFX/light3.wav")
const UNLOCK1 = preload("res://Sounds/SFX/unlock1.wav")
const UNLOCK2 = preload("res://Sounds/SFX/unlock2.wav")

# categories
var GREMLINSOUNDS = [GREMLIN1, GREMLIN2, GREMLIN3, GREMLIN4]
var CLOUDPUFFSOUNDS = [CLOUDPUFFS1, CLOUDPUFFS2]
var OBSIDIANCHUNKSOUNDS = [OBSIDIANCHUNKS1, OBSIDIANCHUNKS2]
var GLOWINGROSESOUNDS = [GLOWINGROSES1, GLOWINGROSES2]
var CORALCRYSTALSOUNDS = [CORALCRYSTALS1, CORALCRYSTALS2]
var LIGHTSOUNDS = [LIGHT1, LIGHT2, LIGHT3]
var UNLOCKSOUNDS = [UNLOCK1, UNLOCK2]

# ost
const TITLESONG = preload("res://Sounds/OST/title.mp3")
const AIRSONG = preload("res://Sounds/OST/cloud puffs.mp3")
const EARTHSONG = preload("res://Sounds/OST/obsidian chunks.mp3")
const FIRESONG = preload("res://Sounds/OST/glowing roses.mp3")
const WATERSONG = preload("res://Sounds/OST/coral crystals.mp3")
const MONSTERSONG = preload("res://Sounds/OST/darkness comes.mp3")
const PLAYERSONG = preload("res://Sounds/OST/a light against the darkness.mp3")

var THEOST = [TITLESONG, AIRSONG, EARTHSONG, FIRESONG, WATERSONG, MONSTERSONG, PLAYERSONG]

onready var audioPlayers: = $AudioPlayers
onready var OSTPlayer: = $OSTPlayer

func play_sound(sound):
	for audioStreamPlayer in audioPlayers.get_children():
		if not audioStreamPlayer.playing:
			audioStreamPlayer.stream = sound
			audioStreamPlayer.play()
			break

func play_category(category):
	var randomSound = category[randi() % category.size()]
	play_sound(randomSound)
	
func play_ost(ost):
		for audioStreamPlayer in OSTPlayer.get_children():
			if not audioStreamPlayer.playing:
				audioStreamPlayer.stream = ost
				audioStreamPlayer.play()
				break
			else:
				audioStreamPlayer.stream = ost
				audioStreamPlayer.play()
				break

func play_random_ost(category):
	var randomSong = category[randi() % category.size()]
	play_ost(randomSong)
