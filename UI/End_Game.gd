extends Control


func _ready():
	$Label.text = "Magical! Your Sorcery is Back!"
	$Label2.text = "Your score was " + str(Global.score)

func _on_Restart_pressed():
	Global.reset()
	var _scene = get_tree().change_scene("res://UI/Main Menu.tscn")

func _on_Quit_pressed():
	get_tree().quit()
