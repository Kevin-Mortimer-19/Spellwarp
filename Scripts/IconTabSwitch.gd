extends Control

onready var tabcontainer = get_node("../TabContainer")

func _on_Air_pressed():
	tabcontainer.set_current_tab(0)
	SoundPlayer.play_category(SoundPlayer.PAGETURNSOUNDS)

func _on_Earth_pressed():
	tabcontainer.set_current_tab(1)
	SoundPlayer.play_category(SoundPlayer.PAGETURNSOUNDS)

func _on_Fire_pressed():
	tabcontainer.set_current_tab(2)
	SoundPlayer.play_category(SoundPlayer.PAGETURNSOUNDS)

func _on_Water_pressed():
	tabcontainer.set_current_tab(3)
	SoundPlayer.play_category(SoundPlayer.PAGETURNSOUNDS)

func _on_Light_pressed():
	tabcontainer.set_current_tab(4)
	SoundPlayer.play_category(SoundPlayer.PAGETURNSOUNDS)
