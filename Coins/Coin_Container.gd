extends Node2D

onready var Coin = load("res://Coins/Coin.tscn")

func _ready():
	pass

func spawn(attr, p):
	var coin = Coin.instance()
	for a in attr:
		coin[a] = attr[a]
		coin.position = p
