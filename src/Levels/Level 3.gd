extends Node2D

func _on_Area2D_body_entered(body):
	if (body.name == "Player"):
		get_tree().change_scene("res://Levels/Level 4.tscn")
