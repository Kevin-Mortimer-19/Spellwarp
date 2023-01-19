extends TextureRect

onready var _anim_player = $AnimationPlayer

func hurt() -> void:
	_anim_player.play("Damage")
	yield(_anim_player, "animation_finished")
