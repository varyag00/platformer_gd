extends KinematicBody2D

class_name Actor

# export makes gravity configurable from editor ([SerializeField])
export var gravity := 500.0
export var speed := Vector2(300.0, 1000.0)
var velocity := Vector2.ZERO


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	# TODO: move this to script later
	velocity.y = max(speed.y, velocity.y)

	move_and_slide(velocity)
