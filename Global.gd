extends Node

var score = 0
var timer = 0

func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func increase_score(s):
	score += s
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_score()
		

func reset():
	score = 0
