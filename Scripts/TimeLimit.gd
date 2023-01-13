extends Timer

# Time (in seconds) until the monster appears
var start_time = 600

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
	start()