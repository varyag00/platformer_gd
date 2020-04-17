extends Actor

class_name Enemy

var _stomp_detector = null


func _ready() -> void:
	# disable physics when off screen (VisibilityEnabler2D)
	set_physics_process(false)
	_velocity.x = -speed.x


func _on_StompDetector_body_entered(body: Node2D) -> void:
	_stomp_detector = get_node("StompDetector")
	if is_player_above_stomp_detector(body, _stomp_detector):
		return
	kill()


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity = change_direction(_velocity)
	_velocity.y = move_and_slide(_velocity, UP_DIRECTION).y


func change_direction(velocity: Vector2) -> Vector2:
	velocity.x *= -1
	return velocity


func is_player_above_stomp_detector(player: Node2D, stomp_detector: Area2D) -> bool:
	var result := player.global_position.y > stomp_detector.global_position.y
	return result


func kill():
	queue_free()
