@tool
extends AutoTileContainer

var _inventory: EntityInventory:
	set(new_inventory):
		
		if new_inventory == _inventory:
			return
		
		columns = new_inventory.size.x
		
		_inventory = new_inventory

## Se ejecuta cuando [GridInventoryUI] ejecuta su funcion _ready
## Carga el inventario que contiene el padre
func _on_inventory_container_ui_ready() -> void:
	_inventory = get_parent().inventory
	
	generate_tiles_from_callable(
		_inventory.size,
		func(x: int, y: int):
			var button := Button.new()
			var item := _inventory.get_item(Vector2(y, x))
			button.name = "Tile({y},{x})".format({"y":y,"x":x})
			button.text = item.name
			button.icon = item.icon
			
			return button
	)
