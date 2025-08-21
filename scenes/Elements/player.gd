extends CharacterBody3D

var speed: float = 10.0
var move_velocity: Vector3 = Vector3.ZERO

func _physics_process(delta: float) -> void:
	var dir = Vector3.ZERO

	if Input.is_action_pressed("ui_up"):
		dir -= transform.basis.z  # Move forward relative to facing direction
	if Input.is_action_pressed("ui_left"):
		transform = transform.rotated(Vector3.UP, deg_to_rad(5))  # Rotate left 5°
	if Input.is_action_pressed("ui_right"):
		transform = transform.rotated(Vector3.UP, deg_to_rad(-5)) # Rotate right 5°
	if Input.is_action_pressed("ui_down"):
		dir += transform.basis.z  # Move forward relative to facing direction
	# Normalize to prevent faster diagonal movement
	if dir != Vector3.ZERO:
		dir = dir.normalized()

	move_velocity = dir * speed
	velocity = move_velocity
	move_and_slide()
