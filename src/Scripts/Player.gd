extends KinematicBody2D

export var ACCELERATION = 64
export var MAX_SPEED = 768
export var FRICTION = 0.25
export var AERIAL_H_RESISTANCE = 0.02
export var GRAVITY = 1980
export var JUMP_FORCE = 888

var velocity = Vector2.ZERO
var deadZone = 0.1

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
onready var animatedSprite = $AnimatedSprite
onready var stateLabel = $StateLabel
onready var stateMachine = $StateMachine

func _apply_velocity(delta):
	handle_input()
	
	if (!is_on_floor()):
		velocity.y += GRAVITY * delta
	
#	move_and_slide returns left over motion. Setting velocity equal
#   to this value will reset our y velocity whenever we hit the 
#   ground
	if (stateMachine.state == stateMachine.states.jump):
		velocity = move_and_slide_with_snap(velocity, Vector2.ZERO, Vector2.UP)
	else:
		velocity = move_and_slide_with_snap(velocity, Vector2(0, 32), Vector2.UP, true)
	
func handle_input():
	var pressingMovement = true
	if (Input.is_action_pressed("move_left")):
		velocity.x += -ACCELERATION
	elif (Input.is_action_pressed("move_right")):
		velocity.x += ACCELERATION
	else:
		pressingMovement = false
	
	if [stateMachine.states.idle, stateMachine.states.run].has(stateMachine.state):
		if Input.is_action_just_pressed("jump"):
			velocity.y = -JUMP_FORCE
		if !pressingMovement:
			velocity.x = lerp(velocity.x, 0, FRICTION)
			
	if [stateMachine.states.jump, stateMachine.states.fall].has(stateMachine.state):
		if Input.is_action_just_released("jump") and velocity.y < -JUMP_FORCE/2:
			velocity.y = -JUMP_FORCE/2
		if !pressingMovement:
			velocity.x = lerp(velocity.x, 0, AERIAL_H_RESISTANCE)

	
	velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)