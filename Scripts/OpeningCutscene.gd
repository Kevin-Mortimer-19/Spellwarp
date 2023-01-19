extends Control

var chungle = load("res://Art/chungle.png")
onready var _transition_rect := get_node("SceneTransitionRect")

var first_scene = "The Monster came from beyond the veil of worlds. It ravaged, it slaughtered, and it destroyed your home. Not even your mastery of magic could stand against its overwhelming darkness."

var second_scene1 = "You have no choice but to flee, to warp away to another dimension and plan your counterattack."
var second_scene2 = "The Monster will not let you escape for long. You must gather the four elements, synthesize them into Light, and strike back against the darkness!"


onready var ViewTimer = $Timer
onready var BG = $TextureRect
onready var dialogue1 = $Dialogue1
onready var dialogue2_1 = $Dialogue2_1
onready var dialogue2_2 = $Dialogue2_2
var viewed : bool = false
var fade_back_in: bool = false

func _ready():
	SoundPlayer.play_ost(SoundPlayer.MONSTERSONG)
	if ViewTimer.is_stopped():
		ViewTimer.start()
	dialogue1.set_text(first_scene)

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
	ViewTimer.wait_time = 10
	ViewTimer.start()
	dialogue1.visible = false
	dialogue2_1.set_text(second_scene1)
	dialogue2_1.visible = true
	dialogue2_2.set_text(second_scene2)
	dialogue2_2.visible = true
	
	BG.texture = chungle
	_transition_rect.fade_in()

func first_view():
	fade_back_in = true
	_transition_rect.fade_out()
	ViewTimer.wait_time = 1
	ViewTimer.start()

func end():
	_transition_rect.transition_to("res://Scenes/Dimension.tscn")
