extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var timer = $Timer
onready var label = $CanvasLayer/Label
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	time += 1
	label.text = str(time)
