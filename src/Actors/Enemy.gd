extends Actor

class_name Enemy

# TODO: add slime bounce animation

enum States { active, inactive }

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

export var score_value = 100
var _stomp_detector = null
var _state = States.active


func _ready() -> void:
	# disable physics when off screen (VisibilityEnabler2D)
	set_physics_process(false)
	_velocity.x = -speed.x


func _on_StompDetector_body_entered(body: Node2D) -> void:
	# disabling collisions doesn't seem to work
	if not _state == States.active:
		return
	_stomp_detector = get_node("StompDetector")
	if not is_player_above_stomp_detector(body, _stomp_detector):
		body.die()
		return
	die()
	body.stomp()


func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity = change_direction(_velocity)
	_velocity.y = move_and_slide(_velocity, UP_DIRECTION).y


func change_direction(velocity: Vector2) -> Vector2:
	velocity.x *= -1
	return velocity


func is_player_above_stomp_detector(player: Node2D, stomp_detector: Area2D) -> bool:
	var result := player.global_position.y <= stomp_detector.global_position.y
	return result


func die() -> void:
	_state = States.inactive
	set_physics_process(false)
	PlayerData.score += score_value
	anim_player.play("on_death")
	yield(anim_player, "animation_finished")
	queue_free()
