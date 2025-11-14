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
	
	super.start()

func end():
	entity = null
	super.end()

func _on_physics_process(delta: float) -> void:
	entity.consume_stamine(delta)

## Si la energia llega 0, cambia el estado a Exausto
func _on_tired():
	#print("Character tired")
	
	#TODO: Crear un estado de Exhausted para que no se pueda correr
	# Cambia el estado a Walking
	state_machine.set_state($"../Exhausted")
