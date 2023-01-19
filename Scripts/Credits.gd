extends Control

onready var anim = $AnimationPlayer

func _ready():
	pass

func _on_end_congrats_timeout():
	anim._play("FadeOut")

func _on_start_credits():
	anim.play("FadeIn")
