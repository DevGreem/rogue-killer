extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _input(event):
	
	if event is InputEventKey and event.pressed:
		
		if event.keycode == KEY_F11:
			
			var current_mode = DisplayServer.window_get_mode()
			
			var new_mode: int = DisplayServer.WINDOW_MODE_FULLSCREEN
			
			if current_mode == new_mode:
				new_mode = DisplayServer.WINDOW_MODE_WINDOWED
			else:
				new_mode = DisplayServer.WINDOW_MODE_FULLSCREEN
			
			DisplayServer.window_set_mode(new_mode)

func _load_config_file(path: String) -> Resource:
	
	if not FileAccess.file_exists(path):
		push_error('Config File "', path, '" Don\'t exists')
		return
	
	var res = ResourceLoader.load(path)
	
	return res
