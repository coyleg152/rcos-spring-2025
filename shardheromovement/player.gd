extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -650.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Handle left/right movement
	if Input.is_action_pressed("left"):
		if !Input.is_action_pressed("right"):
			$AnimatedSprite2D.flip_h = true
			velocity.x = -SPEED
	elif Input.is_action_pressed("right"):
		$AnimatedSprite2D.flip_h = false
		velocity.x = SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
