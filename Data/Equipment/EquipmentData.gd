extends Resource

class_name EquipmentData

signal on_change_weapon(before: ItemData, now: ItemData)
signal on_change_throwable(before: ItemData, now: ItemData)
signal on_change_backpack(before: ItemData, now: ItemData)
signal on_change_head(before: ItemData, now: ItemData)
signal on_change_chest(before: ItemData, now: ItemData)
signal on_change_feet(before: ItemData, now: ItemData)

## Arma equipada actualmente que se usara para los calculos
## Si no tiene arma, por defecto se le pone Punch como arma.
@export var weapon: ItemData:
	set(value):
		
		if value == weapon:
			return
		
		on_change_weapon.emit(weapon, value)
		
		if !value:
			weapon = null # Cambiar a la logica de usar Punch
			return
		
		weapon = value

## Objeto que se podra lanzar
@export var throwable: ItemData:
	set(value):
		
		if throwable == value:
			return
			
		on_change_throwable.emit(throwable, value)
		
		throwable = value

## Mochila para determinar el limite del inventario
@export var backpack: ItemData:
	set(value):
		
		if backpack == value:
			return
		
		on_change_backpack.emit(backpack, value)
		
		backpack = value

## Para armaduras, la cabeza
@export var head: ItemData:
	set(value):
		
		if head == value:
			return
		
		on_change_head.emit(head, value)
		
		head = value

## Para armaduras, el cuerpo
@export var chest: ItemData:
	set(value):
		
		if chest == value:
			return
		
		on_change_chest.emit(chest, value)
		
		chest = value

## Para armaduras, los pies
@export var feet: ItemData:
	set(value):
		
		if feet == value:
			return
		
		on_change_feet.emit(feet, value)
		
		feet = value
