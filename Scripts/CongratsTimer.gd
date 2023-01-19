extends Timer

onready var anim = get_node("../AnimationPlayer")

func _ready():
	start()

func _timeout():
	anim.play("FadeOut")
