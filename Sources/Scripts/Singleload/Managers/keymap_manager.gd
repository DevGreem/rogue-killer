extends Node


func set_new_key(action: String, key: Key) -> void:
	
	for event in InputMap.action_get_events(action):
		InputMap.action_erase_event(action, event)
	
	var key_event = InputEventKey.new()
	key_event.scancode = key
	
	InputMap.action_add_event(action, key_event)
