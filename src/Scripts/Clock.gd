extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var Enemy = preload("res://Scenes/Enemy.tscn")
onready var Enemy2 = preload("res://Scenes/Enemy2.tscn")
onready var Player = $"../Player"

# Called when thepnode enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var enemy = Enemy2.instance()
	enemy.position = position
	#enemy.player = Player
	get_parent().add_child(enemy)
	
