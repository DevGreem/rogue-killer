@tool
extends AutoTileContainer

var _equipment: Equipment

func _on_inventory_container_ui_ready() -> void:
	_equipment = get_parent().equipment
	
	generate_tiles_from_callable(
		_equipment.size,
		func(x: int, y: int):
			var button := Button.new()
			var item := _equipment.get_item(Vector2(x, y))
			
			button.name = "Tile({y},{x})".format({"y":y,"x":x})
			button.text = item.name
			button.icon = item.icon
			button.mouse_entered.connect(func(): _on_mouse_enter(item))
			
			return button
	)

func _on_mouse_enter(item: ItemDefinition):
	print(item.description)
