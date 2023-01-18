extends Control

var chungle = load("res://Art/chungle.png")
onready var _transition_rect := get_node("SceneTransitionRect")

onready var ViewTimer = $Timer
onready var BG = $TextureRect
var viewed : bool = false
var fade_back_in: bool = false

func _ready():
	SoundPlayer.play_ost(SoundPlayer.MONSTERSONG)
	if ViewTimer.is_stopped():
		ViewTimer.start()

func _time_up():
	if viewed:
		end()
	elif fade_back_in:
		second_view()
	else:
		first_view()

func second_view():
	fade_back_in = false
	viewed = true
	ViewTimer.wait_time = 5
	ViewTimer.start()
	BG.texture = chungle
	_transition_rect.fade_in()

func first_view():
	fade_back_in = true
	_transition_rect.fade_out()
	ViewTimer.wait_time = 1
	ViewTimer.start()

func end():
	_transition_rect.transition_to("res://Scenes/Dimension.tscn")
