extends Control

var paused := false setget set_paused
onready var scene_tree: SceneTree = get_tree()
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var score: Label = get_node("Score")
onready var pause_title: Label = get_node("PauseOverlay/Title")


func _ready() -> void:
	# * connects score_updated signal to function update_interface() on object self
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	update_interface()


func _on_PlayerData_player_died() -> void:
	self.paused = true
	pause_title.text = "You died"


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		# * using self.paused calls the setter for paused
		self.paused = not paused
		# * do not let anything else handle this event after
		scene_tree.set_input_as_handled()

func update_interface() -> void:
	score.text = "Score: %s" % PlayerData.score


func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
