extends Timer

onready var main = get_node("..")

onready var Fade = get_node("../UI/SceneTransitionRect")

# Time (in seconds) until the monster appears
var start_time = 15

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

func reset():
	stop()
	set_time()
	main.store_energy()
	start()

func _time_is_up():
	stop()
	main.store_energy()
	Fade.transition_to("res://Scenes/MonsterFight.tscn")

func set_time():
	if ResearchDB.warp_2():
		wait_time = start_time * 1.5
	else:
		wait_time = start_time
