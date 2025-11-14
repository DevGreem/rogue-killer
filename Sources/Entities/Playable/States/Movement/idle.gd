extends EntityIdleMovementState

## Estado donde el jugador esta totalmente quieto
class_name PlayerIdleMovementState

var player: Player

func start():
	player = state_owner
	
	# Pone la velocidad del jugador en todas las velocidades en 0
	player.velocity.x = 0
	player.velocity.y = 0
	
	player.move_and_slide()
	super.start()

func _on_physics_process(delta: float):
	
	# Recarga la energia del jugador porque esta quieto.
	player.reload_stamine(delta)

@warning_ignore('unused_parameter')
func _on_input(event: InputEvent):
	
	# Si el usuario se mueve, cambia a estado Walking
	
	if not UserInput.is_moving():
		return
		
	if Input.is_action_pressed("Shifting"):
		state_machine.set_state($"../Running")
		return
	
	state_machine.set_state($"../Walking")
