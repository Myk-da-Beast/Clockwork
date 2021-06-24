extends KinematicBody2D

onready var player = $"../Player"
onready var animatedSprite = $AnimatedSprite

var speed = 3.5
var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var tracking = 500.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var speedx = rand_range(-5, 5)
	var speedy = rand_range(-5, 5)
	velocity = Vector2(speedx, speedy)
	animatedSprite.play("idle")
	
func _physics_process(delta):
	velocity = position.direction_to(player.position) * speed
	if velocity.x > 0:
		animatedSprite.flip_h = true
	else:
		animatedSprite.flip_h = false
	var collision = move_and_collide(velocity)
	if collision is KinematicCollision2D and collision.collider is Node:
		if collision.collider.is_in_group('Player'):
			Global.reset_current_scene()
