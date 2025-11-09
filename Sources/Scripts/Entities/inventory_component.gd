extends Node

class_name Inventory

## Limite de objetos del inventario
@export var max_inventory: int

## Equipamiento actual de la entidad
var equipment: IEquipment

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
		equipment = IEquipment.new()
	
	inventory = _inventory

## Guarda un item en el inventario
func save_item(item: Item) -> void:
	
	if inventory.has(item.id):
		inventory[item.id].stack.min_value += 1
		return
	
	print("Added item: ", item.name)
	inventory[item.id] = item

## Elimina un item del inventario
func drop_item_by_id(id: String) -> void:
	inventory.erase(id)

## Al entrar al area de un item, lo recoge
func _on_area_entered(area: Area2D) -> void:
	print(area.name)
	
	if area is Item:
		save_item(area)
		area.collect_item()
