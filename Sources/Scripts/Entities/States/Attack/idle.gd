extends StateBase

class_name EntityIdleAttackState

var entity: Entity

func start():
	entity = state_owner
	
	var cooldown := entity.data.stats.attack_cooldown
	
	await get_tree().create_timer(cooldown).timeout
	
	super.start()

func attack():
	
	state_machine.set_state($"../Attacking")
