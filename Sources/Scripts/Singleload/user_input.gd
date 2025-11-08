extends Node

var axis: Vector2

func get_axis() -> Vector2:
	
	axis.x = int(
		Input.is_key_pressed(Config.PREFERENCES.controls.right)
	) - int(
		Input.is_key_pressed(Config.PREFERENCES.controls.left)
	)
	
	axis.y = int(
		Input.is_key_pressed(Config.PREFERENCES.controls.up)
	) - int(
		Input.is_key_pressed(Config.PREFERENCES.controls.down)
	)
	
	return axis.normalized()
