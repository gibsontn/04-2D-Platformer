extends Node

var score = 0
var timer = 0

func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func increase_score(s):
	score += s
