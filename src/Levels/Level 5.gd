extends Node2D



func _on_Exit_body_entered(body):
	if (body.name == "Player"):
		get_tree().change_scene("res://Levels/Level 6.tscn")



func _on_Death_Box_body_entered(body):
	if (body.name == "Player"):
		get_tree().change_scene("res://Levels/Level 5.tscn")


func _on_Death_Box_2_body_entered(body):
	if (body.name == "Player"):
		get_tree().change_scene("res://Levels/Level 5.tscn")
