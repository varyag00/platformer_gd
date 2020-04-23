extends Control

onready var results: Label = get_node("Title/Results")


func _ready() -> void:
	results.text = results.text % [PlayerData.score, PlayerData.deaths]
