extends Control

class_name InventoryUI

signal on_open_inventory(_inventory: EntityInventory, _equipment: Equipment)
signal on_close_inventory
signal on_change_inventory(before: EntityInventory, now: EntityInventory)
signal on_change_equipment(before: Equipment, now: Equipment)

@export var inventory: EntityInventory:
	set(value):
		
		if value == inventory:
			return
		
		on_change_inventory.emit(inventory, value)
		inventory = value
		
@export var equipment: Equipment:
	set(value):
		
		if value == equipment:
			return
		
		on_change_equipment.emit(equipment, value)
		equipment = value

@onready var tooltip: ItemTooltip = $ItemTooltip

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
