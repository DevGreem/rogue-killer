extends PlayerIdleMovementState

class_name PlayerExhaustedIdleMovementState

func _on_physics_process(_delta: float):
	
	super._on_physics_process(_delta)
	
	var duration = player.data.stats.stamine.duration
	
	if duration.current_value == duration.max_value:
		state_machine.set_state($"../Idle")

func _on_input(_event: InputEvent):
	
	if UserInput.is_moving():
		state_machine.set_state($"../Exhausted")
