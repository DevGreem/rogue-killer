@tool
extends Entity

class_name Player

func _process(_delta):
	
	if Engine.is_editor_hint():
		return
	
	var mouse_position = get_global_mouse_position()
	
	look_at(mouse_position)

#func _input(event):
	#
	#if event is InputEventMouse:
		#
		#var direction = event.position
		#
		#look_at(direction)

func _on_dead() -> void:
	queue_free()
