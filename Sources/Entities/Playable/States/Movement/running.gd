extends EntityRunningMovementState

## Estado de correr del jugador
## Hereda de EntityRunningMovementState
class_name PlayerRunningMovementState

func _on_physics_process(delta: float):
	
	var axis := UserInput.get_axis()
	
	var walk_speed = entity.data.stats.walk_speed
	var run_speed = entity.data.stats.run_speed
	
	# Cambia la velocidad del jugador
	entity.velocity.x = axis.x * delta * walk_speed * run_speed
	entity.velocity.y = axis.y * delta * -walk_speed * run_speed
	
	entity.move_and_slide()
	entity.consume_stamine(delta)

func _on_input(_event: InputEvent):
	
	# Si el jugador no esta presionando SHIFT, vuelve al estado Walking
	if not Input.is_key_pressed(KEY_SHIFT):
		state_machine.set_state($"../Walking")
