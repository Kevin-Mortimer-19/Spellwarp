extends Control

onready var _transition = $SceneTransitionRect

func _ready():
	SoundPlayer.play_ost(SoundPlayer.MONSTERSONG)

func _on_restart_pressed():
	_transition.transition_to("res://Scenes/OpeningCutscene.tscn")
