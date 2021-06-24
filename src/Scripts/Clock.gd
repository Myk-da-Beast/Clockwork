extends KinematicBody2D

onready var Enemy = preload("res://Scenes/Enemy.tscn")
onready var Enemy2 = preload("res://Scenes/Enemy2.tscn")
onready var Player = $"../Player"
onready var Timer = $"Timer"

func _on_Timer_timeout():
	var enemy = Enemy.instance()
	enemy.position = position
	
	get_parent().add_child(enemy)

func _on_Sensor_body_entered(body):
	if (body.name == "Player"):
		Timer.start()

func _on_Sensor_body_exited(body):
	if (body.name == "Player"):
		Timer.stop()