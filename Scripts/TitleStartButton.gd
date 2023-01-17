extends Button

onready var _transition_rect := get_node("../SceneTransitionRect")

func _pressed():
	_transition_rect.transition_to("res://Scenes/Dimension.tscn")
