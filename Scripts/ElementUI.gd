extends Node

const thousand = 1000
const million = 1000000
const billion = 1000000000
const trillion = 1000000000000

func display_element(label, s, count):
	if count > trillion:
		label.text = s % str(count / trillion) + "T"
	elif count > billion:
		label.text = s % str(count / billion) + "B"
	elif count > million:
		label.text = s % str(count / million) + "M"
	elif count > thousand:
		label.text = s % str(count / thousand) + "K"
	else:
		label.text = s % count
