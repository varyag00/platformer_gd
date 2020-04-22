extends Button


func _on_button_up() -> void:
	PlayerData.score = 0
	# TODO: test setting scene tree var
	get_tree().paused = false
	get_tree().reload_current_scene()
