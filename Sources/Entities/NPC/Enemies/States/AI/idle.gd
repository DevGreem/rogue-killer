extends StateBase

class_name EnemyIdleAIState

var enemy: Enemy

func start():
	
	enemy = state_owner
	
	super.start()

func end():
	enemy = null
	super.end()
