extends Node

class_name InventoryComponent

## Limite de objetos del inventario
@export var max_inventory: int

# TODO: Crear un Resource que se llame Equipment
## Equipamiento actual de la entidad
var equipment

## Inventario donde se guardaran objetos
var inventory: Dictionary[String, Item]:
	set(value):
		# Si el nuevo value supera el tamaño limite, no cambia nada y emite una señal
		if value.size() > max_inventory:
			return false
		
		inventory = value

func _init(_inventory: Dictionary[String, Item] = {}, _equipment = null):
	
	if _equipment:
		equipment = _equipment
	else:
		equipment = null # Por
	
	inventory = _inventory

## Guarda un item en el inventario
func save_item(item: Item) -> void:
	
	if inventory.has(item.data.ID):
		inventory[item.data.ID].stack.min_value += 1
		return
	
	#print("Added item: ", item.name)
	inventory[item.data.ID] = item

## Elimina un item del inventario
func drop_item_by_id(id: String) -> void:
	inventory.erase(id)

## Al entrar al area de un item, lo recoge
func _on_area_entered(area: Area2D) -> void:
	#print(area.name)
	
	if area is Item:
		save_item(area)
		area.collect_item()
