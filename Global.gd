extends Node

var score = 0
var timer = 0

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		var menu = get_node_or_null("root/Game/UI/Menu")
		if menu != null:
			var p = get_tree().paused
			if p:
				menu.hide()
				get_tree().paused = false
			else:
				menu.show()
				get_tree().paused = true

func increase_score(s):
	score += s
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_score()
		

func reset():
	score = 0
