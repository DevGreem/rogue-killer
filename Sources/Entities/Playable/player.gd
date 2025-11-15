@tool
extends Entity

class_name Player

@onready var inventory_ui: InventoryUI = $CanvasLayer/InventoryUI

func _input(_event: InputEvent):
	
	if Engine.is_editor_hint():
		return
	
	var mouse_position = get_global_mouse_position()
	
	look_at(mouse_position)
	
	if Input.is_action_just_pressed("Open-Inventory"):
		
		if inventory_ui.visible:
			inventory_ui.close_inventory()
		else:
			inventory_ui.see_inventory()

func _on_dead() -> void:
	die()

func die():
	var dead_camera := Camera2D.new()
	
	dead_camera.name = "Dead Camera"
	dead_camera.global_position = global_position
	
	get_parent().add_child(dead_camera)
	
	super.die()
