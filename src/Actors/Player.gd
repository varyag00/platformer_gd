extends Actor

# TODO: implement double jump


# * when overriding parent's function, subclasses will implicitly call super(func)
func _physics_process(delta: float) -> void:
	var is_jump_interrupted := (
		Input.is_action_just_released("jump")
		and _velocity.y < 0.0
	)
	var direction := get_direction()
	_velocity = calculate_move_velocity(
		_velocity, direction, speed, delta, is_jump_interrupted
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
	speed: Vector2,
	delta: float,
	is_jump_interrupted: bool
) -> Vector2:
	var new_velocity := linear_velocity
	new_velocity.x = speed.x * direction.x
	# TODO: test adding this back in when gravity is working
	# velocity.y = min(speed.y, velocity.y)
	_velocity.y += gravity * delta
	# TODO: determine why player only jumps for one frame
	# if direction.y == -1.0: # ! this logic is wrong
	if direction.y != 0.0:
		new_velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		new_velocity.y = 0.0
	return new_velocity
