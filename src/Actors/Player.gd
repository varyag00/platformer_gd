extends Actor

# TODO: implement double jump

export var run_speed := 600
export var walk_speed := 300


func _physics_process(delta: float) -> void:
	speed = calculate_move_speed(speed)
	var direction := get_direction()
	var is_jump_interrupted := (
		Input.is_action_just_released("jump")
		and _velocity.y < 0.0
	)

	_velocity = calculate_move_velocity(
		speed, _velocity, direction, delta, is_jump_interrupted
	)
	_velocity = move_and_slide(_velocity, UP_DIRECTION)


func get_direction() -> Vector2:
	var dir := Vector2(
		(
			Input.get_action_strength("move_right")
			- Input.get_action_strength("move_left")
		),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	)
	return dir


func calculate_move_speed(speed: Vector2) -> Vector2:
	var new_speed := speed
	# only allow change of x speed when on the ground
	if is_on_floor():
		new_speed.x = walk_speed
		if Input.is_action_pressed("sprint"):
			new_speed.x = run_speed
	return new_speed


func calculate_move_velocity(
	move_speed: Vector2,
	linear_velocity: Vector2,
	direction: Vector2,
	delta: float,
	is_jump_interrupted: bool
) -> Vector2:
	var new_velocity := linear_velocity
	new_velocity.x = direction.x * move_speed.x
	new_velocity.y += gravity * delta
	# prevents y velocity from increasing infinitely due to gravity
	new_velocity.y = max(linear_velocity.y, new_velocity.y)

	# check for jumps
	if direction.y == -1.0:
		new_velocity.y = move_speed.y * direction.y

	if is_jump_interrupted:
		new_velocity.y = 0.0

	return new_velocity
