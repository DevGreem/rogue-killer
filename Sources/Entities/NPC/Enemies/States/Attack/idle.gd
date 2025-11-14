extends EntityIdleAttackState

class_name EnemyIdleAttackState

var player: Player

func end():
	player = null
	super.end()

func _on_physics_process(_delta: float) -> void:
	
	if !player:
		return
	
	var distance := entity.global_position.distance_to(player.global_position)
	
	if distance <= 500:
		attack()

func _on_detect_player(body: Player) -> void:
	player = body
