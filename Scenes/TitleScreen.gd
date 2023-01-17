extends Control

onready var _transition_rect := get_node("SceneTransitionRect")

func _ready():
	SoundPlayer.play_ost(SoundPlayer.TITLESONG)

func _on_start_button_pressed():
	_transition_rect.transition_to("res://Scenes/Dimension.tscn")
