extends "res://scripts/StateMachine.gd"

func _ready():
	add_state("idle")
	add_state("run")
	add_state("jump")
	add_state("fall")
	call_deferred("set_state", states.idle)

func _state_logic(delta):
	# call methods on parent like parent.apply_gravity
	parent._apply_velocity(delta)
	pass

func _get_transition(delta):
	match state:
		states.idle:
			if Input.is_action_pressed("jump"):
				return states.jump
			elif abs(parent.velocity.x) > 1:
				return states.run
		states.run:
			if !parent.is_on_floor() and !Input.is_action_just_pressed("jump"):
				return states.fall
			if Input.is_action_pressed("jump") && parent.is_on_floor():
				print("welp")
				return states.jump
			elif parent.velocity.x == 0 || abs(parent.velocity.x) < 1:
				return states.idle
		states.jump:
			if parent.is_on_floor():
				return states.idle
			elif parent.velocity.y >= 0:
				return states.fall
		states.fall:
			if parent.is_on_floor():
				return states.idle
				
	return null

func _enter_state(newState, oldState):
	match newState:
		states.idle:
			parent.stateLabel.text = "idle"
			parent.animatedSprite.play("idle")
		states.run:
			parent.stateLabel.text = "run"
			parent.animatedSprite.play("run")
		states.jump:
			parent.stateLabel.text = "jump"
			parent.animatedSprite.play("jump")
		states.fall:
			parent.stateLabel.text = "fall"
	pass

func _exit_state(oldState, newState):
	pass
