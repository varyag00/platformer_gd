tool
extends Button

export(String, FILE) var next_scene_path := ""


func _on_button_up() -> void:
	PlayerData.reset_game()
	get_tree().change_scene(next_scene_path)

	# # ! possibly include this?
	# PlayerData.score = 0
	# # TODO: test setting scene tree var
	# get_tree().paused = false
	# get_tree().reload_current_scene()



func _get_configuration_warning() -> String:
	if next_scene_path == "":
		return "Next Scene Path must be set."
	return ""
