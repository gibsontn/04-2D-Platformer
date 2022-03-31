extends Node2D

onready var Scorpion = load("res://Enemy/Enemy_Sprites/Scorpion.tscn")
onready var Goblin = load("res://Enemy/Enemy_Sprites/Goblin.tscn")

func _physics_process(_delta):
	if not has_node("Scorpion"):
		var scorpion = Scorpion.instance()
		add_child(scorpion)
		scorpion.name = 'Scorpion'
	if not has_node("Goblin"):
		var goblin = Goblin.instance()
		add_child(goblin)
		goblin.name = 'Goblin'
