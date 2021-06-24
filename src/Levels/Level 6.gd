extends Node2D



func _on_Death_Box_body_entered(body):
	if (body.name == "Player"):
		Global.reset_current_scene()

func _on_Death_Box_2_body_entered(body):
	if (body.name == "Player"):
		Global.reset_current_scene()

func _on_Death_Box_3_body_entered(body):
	if (body.name == "Player"):
		Global.reset_current_scene()
