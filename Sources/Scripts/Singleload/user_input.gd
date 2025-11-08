extends Node

var axis: Vector2

func get_axis() -> Vector2:
	
	axis.x = int(
		Input.is_action_pressed('Walk-Right')) - int(Input.is_action_pressed('Walk-Left')
	)
	
	axis.y = int(
		Input.is_action_pressed('Walk-Up')) - int(Input.is_action_pressed('Walk-Down')
	)
	
	return axis.normalized()
