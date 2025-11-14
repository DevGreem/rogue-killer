extends PlayerWalkingMovementState

class_name PlayerExhaustedMovementState

func _on_physics_process(_delta: float):
	
	super._on_physics_process(_delta)
	
	var duration := entity.data.stats.stamine.duration
	
	if duration.current_value == duration.max_value:
		state_machine.set_state($"../Walking")

func _on_input(_event: InputEvent):
	
	if not UserInput.is_moving():
		state_machine.set_state($"../Exhausted-Idle")
