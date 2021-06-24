extends Node2D

func _on_Exit_body_entered(body):
	if (body.name == "Player"):
		Global.goto_scene("res://Levels/Level 3.tscn")
