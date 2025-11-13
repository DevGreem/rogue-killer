extends Node2D

@onready var inventory: Inventory = $Inventory
@onready var other_inventory: Inventory = $Inventory2
@onready var simple_inventory_ui: SimpleInventoryUI = $HBoxContainer/SimpleInventoryUI
@onready var other_simple_inventory_ui: SimpleInventoryUI = $HBoxContainer/SimpleInventoryUI2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@warning_ignore('unused_parameter')
func _input(event: InputEvent):
	
	if Input.is_action_just_pressed('Interact'):
		print("Inventory Stacks:")
		for item in inventory.stacks:
			
			if item.item_id != "":
				prints(item.item_id, " x ", item.amount)
			else:
				print("Empty")
	
	if Input.is_action_just_pressed("Add-Item"):
		inventory.add("testitem", 1)


func _on_left_button_down() -> void:
	var selected_items: Array[int] = simple_inventory_ui.get_selected_inventory_items()
	if selected_items.is_empty():
		return

	for selected_item_index in selected_items:
		inventory.transfer(selected_item_index, other_inventory)


func _on_right_button_down() -> void:
	var selected_items: Array[int] = other_simple_inventory_ui.get_selected_inventory_items()
	if selected_items.is_empty():
		return

	for selected_item_index in selected_items:
		other_inventory.transfer(selected_item_index, inventory)
