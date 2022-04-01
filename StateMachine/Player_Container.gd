extends Node2D

var starting_position = Vector2(200,200)
onready var Player = load("res://Player/Player.tscn")


func _physics_process(_delta):
	var player = get_node_or_null("Player")
	if player == null:
		spawn(starting_position)

func spawn(p):
	var player = Player.instance()
	player.position = p
	player.name = "Player"
	add_child(player)
