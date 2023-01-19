extends Timer

onready var main = get_node("..")

onready var Fade = get_node("../UI/SceneTransitionRect")

var time_is_almost_up = false

# Time (in seconds) until the monster appears
var start_time = 600

onready var Display = $Display

var text = " remain until the Monster arrives"

func _ready():
	set_time()
	start()

func _process(delta):
	var minutes = int(get_time_left()) / 60
	var seconds = int(get_time_left()) % 60
	
	if seconds < 10:
		Display.set_text(str(minutes) + ":0" + str(seconds) + text)
	else:
		Display.set_text(str(minutes) + ":" + str(seconds) + text)
	
	if time_left < 60 && !time_is_almost_up:
		time_is_almost_up = true
		SoundPlayer.play_ost(SoundPlayer.MONSTERSONG)

func reset():
	stop()
	set_time()
	main.store_energy()
	start()

func _on_challenge_pressed():
	main.store_energy()
	Fade.transition_to("res://Scenes/MonsterFight.tscn")

func _time_is_up():
	stop()
	main.store_energy()
	Fade.transition_to("res://Scenes/MonsterFight.tscn")

func set_time():
	if ResearchDB.warp_2():
		wait_time = 900
	else:
		wait_time = start_time
