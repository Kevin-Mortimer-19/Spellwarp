extends Control
var resource_creator = load("res://ResourceCreator.gd")

onready var bean_count: Label = $VBoxContainer/Label1

onready var bean_farmer_label: Label = $VBoxContainer/Label2
onready var bean_farmer_button = $VBoxContainer/Button2
onready var bean_farmer_timer: Timer = $VBoxContainer/Timer1

var count: int = 0 setget set_count, get_count

var clicker_add: int = 1

var bean_farmer_count := 0

#var bean_farmer_yield := 1
#var bean_farmer_cost: int = 10
var bean_farm = resource_creator.new(10, 1, 1.0)

func _ready():
	bean_count.text = "bean count: %s" % count
	bean_farmer_label.text = "bean farmer count: %s" % bean_farmer_count
	bean_farmer_timer.wait_time = bean_farm.get_time()
	
func _process(delta):
	bean_farmer_button.disabled = get_count() < bean_farm.get_cost()
	
	if bean_farmer_count > 0:
		if bean_farmer_timer.is_stopped():
			bean_farmer_timer.start()

func set_count(value) -> void:
	count += value
	bean_count.text = "bean count: %s" % count

func get_count() -> int:
	return count

func _on_check_button_pressed():
	set_count(clicker_add)

func _on_buy_bean_farmer_button_pressed():
	set_count(-1 * abs(bean_farm.get_cost()))
	bean_farmer_count += 1
	bean_farm.set_cost(bean_farm.get_cost() + 10 * bean_farmer_count)
	bean_farmer_label.text = "bean farmer count: %s" % bean_farmer_count

func _on_bean_farmer_timer_timeout():
	set_count(bean_farmer_count * bean_farm.get_output())
