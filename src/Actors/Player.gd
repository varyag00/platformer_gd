extends Actor

# TODO: implement double jump
# TODO: don't allow player to change speed in the air
# ! BUG: player does not maintain their run speed in the air
# !   - This is probably because don't keep a ref to the last move speeed
# ! BUG: _velocity.y keeps decreasing indefinitely when player on the ground

export var run_speed := 600
export var walk_speed := 300
var _move_speed := Vector2.ZERO


func _physics_process(delta: float) -> void:
	_move_speed = calculate_move_speed(speed)
	var direction := get_direction()
	var is_jump_interrupted := (
		Input.is_action_just_released("jump")
		and _velocity.y < 0.0
	)

	_velocity = calculate_move_velocity(
		_move_speed, _velocity, direction, delta, is_jump_interrupted
	)
	move_and_slide(_velocity, UP_DIRECTION)


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
	else:
		# TODO: keep current speed, which should already bdone in := speed ....
		pass
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
	# TODO: test if this fixes the ever-increasing y
	new_velocity.y = max(linear_velocity.y, new_velocity.y)

	# check for jumps
	if direction.y == -1.0:
		new_velocity.y = move_speed.y * direction.y

	if is_jump_interrupted:
		new_velocity.y = 0.0

	return new_velocity
