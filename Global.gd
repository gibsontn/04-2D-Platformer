extends Node

var score = 0
var timer = 0

var saves = [
	"user://game-data_0.json"
]

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		var menu = get_node_or_null("/root/Game/UI/Menu")
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


func get_save_data():
	var data = {
		"score":score
		,"player":""
		,"coins":[]
	}
	var player = get_node_or_null("/root/Game/Player_Container/Player")
	if player != null:
		data["player"] = var2str(player.position)
	var coins = get_node("/root/Game/Coin_Container").get_children()
	for c in coins:
		var temp = {"position":c.position, "score":c.score}
		data["coins"].append(temp)
	return data

func load_save_data(data):
	score = data["score"]
	if data["player"] != "":
		get_node("/root/Game/Player_Container").spawn(str2var(data["player"]))
	pass

func save_game(which_file):
	var file = File.new()
	var data = get_save_data()
	file.open(saves[which_file], File.WRITE)
	file.store_string(to_json(data))
	file.close()

func load_game(which_file):
	var file = File.new()
	if file.file_exists(saves[which_file]):
		file.open(saves[which_file], File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			pass
		else:
			printerr("Corrupted data")
	else:
		printerr("No saved data")
