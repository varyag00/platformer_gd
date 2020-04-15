extends Actor

# TODO: implement double jump


func _physics_process(delta: float) -> void:
	var direction := get_direction()
	var is_jump_interrupted := (
		Input.is_action_just_released("jump")
		and _velocity.y < 0.0
	)

	_velocity = calculate_move_velocity(
		_velocity, direction, delta, is_jump_interrupted
	)
	move_and_slide(_velocity, Vector2.UP)


func get_direction() -> Vector2:
	var dir := Vector2(
		(
			Input.get_action_strength("move_right")
			- Input.get_action_strength("move_left")
		),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	)
	return dir


func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	delta: float,
	is_jump_interrupted: bool
) -> Vector2:
	var new_velocity := linear_velocity
	new_velocity.x = direction.x * speed.x
	new_velocity.y += gravity * delta

	# check for jumps
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y

	if is_jump_interrupted:
		new_velocity.y = 0.0

	return new_velocity
