extends Node2D

onready var Scorpion = load("res://Enemy/Enemy_Sprites/Scorpion.tscn")

func _physics_process(_delta):
	if not has_node("Scorpion"):
		var scorpion = Scorpion.instance()
		add_child(scorpion)
		scorpion.name = 'Scorpion'
