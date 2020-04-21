extends Area2D

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

export var score_value = 100


func _on_Coin_body_entered(body: Node) -> void:
	PlayerData.score += score_value
	anim_player.play("fade_out")
