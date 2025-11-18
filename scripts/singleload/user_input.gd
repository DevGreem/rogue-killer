extends Node

## Devuelve hacia donde se mueve el jugador
func get_axis() -> Vector2:
	
	var axis := Vector2()
	
	axis.x = int(
		Input.is_action_pressed('Walk-Right')) - int(Input.is_action_pressed('Walk-Left')
	)
	
	axis.y = int(
		Input.is_action_pressed('Walk-Up')) - int(Input.is_action_pressed('Walk-Down')
	)
	
	return axis.normalized()

## Devuelve [color=green]true[/color] si el jugador se esta moviendo
func is_moving() -> bool:
	var axis = get_axis()
	
	return axis.x != 0 or axis.y != 0
