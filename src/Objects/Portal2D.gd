# * tool = run _all_ code in this file in the editor viewport
# * i.e. don't do animation code here
tool
extends Area2D

# $ is shorthand for get_node()
onready var anim_player: AnimationPlayer = $AnimationPlayer

# * PackedScene = .tscn
export var next_scene: PackedScene


func _get_configuration_warning() -> String:
	if not next_scene:
		return "Next Scene property must be set."
	return ""


func teleport() -> void:
	anim_player.play("fade_in_black")
	# * yield = wait for arg1 to emit signal arg2
	yield(anim_player, "animation_finished")
	# scene tree has the change_scene_to
	get_tree().change_scene_to(next_scene)


func _on_Portal2D_body_entered(body: Node2D) -> void:
	teleport()
