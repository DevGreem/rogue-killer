extends StateBase

class_name EntityIdleAttackState

var entity: Entity

var timer: Signal

func start():
	entity = state_owner
	
	var cooldown := entity.data.stats.attack_cooldown
	
	timer = get_tree().create_timer(cooldown).timeout
	
	super.start()

func attack():
	
	await timer
	
	state_machine.set_state($"../Attacking")
