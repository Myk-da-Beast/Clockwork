extends Node2D

func _on_Area2D_body_entered(body):
	if (body.name == "Player"):
		Global.goto_scene("res://Levels/Level 4.tscn")
