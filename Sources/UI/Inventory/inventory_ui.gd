@tool
extends HBoxContainer
class_name GridInventoryUI

signal on_open_inventory(_inventory: EntityInventory, _equipment: Equipment)
signal on_close_inventory
signal on_change_inventory(before: EntityInventory, now: EntityInventory)

@export var inventory: EntityInventory:
	set(value):
		
		if value == inventory:
			return
		
		on_change_inventory.emit(inventory, value)
		inventory = value
		
@export var equipment: Equipment

## Muestra la interfaz del inventario
func see_inventory():
	print("Mostrando inventario")
	on_open_inventory.emit(inventory, equipment)
	show()

## Oculta la interfaz del inventario
func close_inventory():
	print("Cerrando inventario")
	on_close_inventory.emit()
	hide()

func _input(_event: InputEvent):
	
	if !visible:
		return
	
	if Input.is_action_just_pressed("Close-Inventory"):
		close_inventory()
