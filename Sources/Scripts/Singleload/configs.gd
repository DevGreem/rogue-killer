extends Node

var PREFERENCES := IPreferences.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	__load_config_file("preferences", PREFERENCES)

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

func __load_config_file(file_name: String, obj: Interface) -> void:
	
	var json = JsonManager.load_json("res://Configs/"+file_name+".json")
	
	JsonManager.json_to_class(json, obj)
