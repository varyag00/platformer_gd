extends KinematicBody2D

class_name Actor

# export == [SerializeField]
export var gravity := 4000.0
export var speed := Vector2(300.0, 1000.0)
var _velocity := Vector2.ZERO


# func _physics_process(delta: float) -> void:
# 	velocity.y += gravity * delta
# 	# TODO: move this to script later
# 	# velocity.y = max(speed.y, velocity.y)
