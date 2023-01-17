extends Button

func _on_warp_pressed():
	StoredEnergy.air = 0
	StoredEnergy.earth = 0
	StoredEnergy.fire = 0
	StoredEnergy.water = 0
	StoredEnergy.light = 0
	get_tree().change_scene("res://Scenes/Dimension.tscn")
