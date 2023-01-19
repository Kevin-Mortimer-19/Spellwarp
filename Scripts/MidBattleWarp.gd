extends Button

func _on_warp_pressed():
	StoredEnergy.air = 0
	StoredEnergy.earth = 0
	StoredEnergy.fire = 0
	StoredEnergy.water = 0
	StoredEnergy.light = 0
	SoundPlayer.play_sound(SoundPlayer.WARPSOUND1)
	SoundPlayer.play_sound(SoundPlayer.WARPSOUND2)
	SoundPlayer.play_sound(SoundPlayer.WARPSOUND3)
	get_tree().change_scene("res://Scenes/Dimension.tscn")
