extends EntityWalkingMovementState

## Estado donde el jugador se mueve a velocidad normal ([param walk_speed])
class_name PlayerWalkingMovementState

func _on_physics_process(delta: float):
	
	var axis := UserInput.get_axis()
	
	var walk_speed := entity.data.stats.walk_speed
	
	# Cambia la velocidad del jugador para que se mueva
	entity.velocity.x = axis.x * delta * walk_speed
	entity.velocity.y = axis.y * delta * -walk_speed
	
	entity.move_and_slide()
	entity.reload_stamine(delta)

func _on_input(_event: InputEvent):
	
	# Si el jugador no se esta moviendo vuelve al estado Idle
	if not UserInput.is_moving():
		state_machine.set_state($"../Idle")
	
	# Si el jugador presiona shift cambia el estado a Running
	if Input.is_key_pressed(KEY_SHIFT):
		state_machine.set_state($"../Running")
