extends StateBase

class_name EntityRunningMovementState

var entity: Entity

func start():
	entity = state_owner
	#print("Started Running State And Connected Signal")
	# Se conecta a la signal para cuando expira la duracion de la energia
	Utilities.if_not_connected(
		entity.data.stats.stamine.duration.expired,
		_on_tired
	)

func end():
	pass

func _on_physics_process(delta: float) -> void:
	entity.consume_stamine(delta)

## Si se expira la duracion de la energia, cambia el estado a Walking
func _on_tired():
	#print("Character tired")
	# Cambia el estado a Walking
	state_machine.set_state($"../Walking")
