extends StateBase

class_name EnemyPatrolAIState

signal on_detect_player(body: Player)

func _on_detect_player(body: Node2D) -> void:
	
	if not body is Player:
		return
	
	on_detect_player.emit(body)
	state_machine.set_state($"../Chase")
