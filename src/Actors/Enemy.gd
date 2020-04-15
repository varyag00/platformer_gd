extends Actor

class_name Enemy


func _ready() -> void:
	# VisibilityEnabler2D deactivates the enemy when off screen
	set_physics_process(false)
	_velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity = change_direction(_velocity)
	_velocity.y = move_and_slide(_velocity, UP_DIRECTION).y


func change_direction(velocity: Vector2) -> Vector2:
	velocity.x *= -1
	return velocity
