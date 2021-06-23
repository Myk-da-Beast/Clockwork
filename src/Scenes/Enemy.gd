extends KinematicBody2D

onready var player = $"../Player"

var speed = 350
var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var tracking = 500.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var speedx = rand_range(-5, 5)
	var speedy = rand_range(-5, 5)
	velocity = Vector2(speedx, speedy)

func seek():
	var steer = Vector2.ZERO
	if player:
		var desired = (player.position - position).normalized() * speed
		steer = (desired - velocity).normalized() * tracking
	return steer
	
func _physics_process(delta):
	acceleration = seek()
	velocity += acceleration * delta
	velocity = velocity.clamped(speed)
	rotation = velocity.angle()
	position += velocity * delta
