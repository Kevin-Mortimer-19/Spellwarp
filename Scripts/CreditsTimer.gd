extends Timer

onready var anim = get_node("../../Label/AnimationPlayer")

func _ready():
	start()

func _timeout():
	anim.play("FadeIn")
	stop()
