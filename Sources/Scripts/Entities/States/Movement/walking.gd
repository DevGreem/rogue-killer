extends StateBase

class_name EntityWalkingMovementState

var entity: Entity

func start():
	entity = state_owner
	
	super.start()

func end():
	pass
