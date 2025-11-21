extends CharacterBody3D

var speed: float = 10.0
var gravity: float = 9.8 *50
var move_velocity: Vector3 = Vector3.ZERO
var jump_impulse: float = 200

@onready var fsm=$Fsm

func _ready() -> void:
	fsm.autoload(self)
	fsm.set_debug_on($Label)
	fsm.addStateTransition("falling","idle",grounded)
	fsm.addStateTransition("idle","jump",grounded)
	fsm.addStateTransition("jump","falling",is_falling)
	
	fsm.startState()
	
func _physics_process(delta: float) -> void:
	fsm.fsmUpdate(delta)
	var dir = Vector3.ZERO

	if Input.is_action_pressed("ui_up"):
		dir -= transform.basis.z  # Move forward relative to facing direction
	if Input.is_action_pressed("ui_left"):
		transform.basis = transform.basis.rotated(Vector3.UP, deg_to_rad(5))
	if Input.is_action_pressed("ui_right"):
		transform.basis = transform.basis.rotated(Vector3.UP, deg_to_rad(-5))
	if Input.is_action_pressed("ui_down"):
		dir += transform.basis.z  # Move forward relative to facing direction
	# Normalize to prevent faster diagonal movement
	
	if dir != Vector3.ZERO:
		dir = dir.normalized()

		
	move_velocity = dir * speed
	velocity = move_velocity
	# JUMP INPUT
	if grounded():
		if Input.is_action_just_pressed("ui_back"):
			velocity.y = jump_impulse
		if velocity.y < 0:
			velocity.y = 0
			
	else:
		velocity.y -= gravity * delta

		
	move_and_slide()

func is_falling():
	return velocity.y <0 and not grounded() 
	
func grounded():
	var ray= $groundDetector
	return ray.is_colliding()
	
func is_on_front():
	var ray= $onfront
	return ray.is_colliding()
