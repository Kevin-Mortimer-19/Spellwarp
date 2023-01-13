extends Timer

onready var main = get_node("..")

# Time (in seconds) until the monster appears
var start_time = 15

onready var Display = $Display

func _ready():
	wait_time = start_time
	start()

func _process(delta):
	var minutes = int(get_time_left()) / 60
	var seconds = int(get_time_left()) % 60
	Display.set_text(str(minutes) + ":" + str(seconds))

func reset():
	stop()
	wait_time = start_time
	main.store_energy()
	start()

func _time_is_up():
	main.store_energy()
	get_tree().change_scene("res://Scenes/MonsterFight.tscn")