extends KinematicBody2D

onready var Enemy = preload("res://Scenes/Enemy.tscn")
onready var Enemy2 = preload("res://Scenes/Enemy2.tscn")
onready var Player = $"../Player"

func _on_Timer_timeout():
	var enemy = Enemy.instance()
	enemy.position = position
	
	get_parent().add_child(enemy)
