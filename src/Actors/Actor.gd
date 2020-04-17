extends KinematicBody2D

class_name Actor

export var gravity := 4000
export var speed := Vector2(300.0, 1000.0)
var _velocity := Vector2.ZERO

# used for move_and_slide
const UP_DIRECTION = Vector2.UP
