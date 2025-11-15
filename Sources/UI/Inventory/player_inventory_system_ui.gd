extends AutoTileContainer

class_name PlayerInventorySystemUI

@onready var ui: InventoryUI = owner

signal on_hover_item
signal on_unhover_item

func _ready():
	
	var inventory := get_inventory()
	columns = inventory.size.x
	
	inventory.contents_changed.connect(_load_inventory)
	
	_load_inventory()

func get_inventory() -> EntityInventory:
	return ui.equipment

func _load_inventory():
	_unload_inventory()
	
	var inventory := get_inventory()
	
	generate_tiles_from_callable(
		inventory.size,
		func(x: int, y: int):
			var button := Button.new()
			var item := inventory.get_item(Vector2(x, y))
			
			button.set_meta("item_id", item.id)
			
			button.name = "Tile({y},{x})".format({"y":y,"x":x})
			button.icon = item.icon
			
			if item.id != "empty" and item.id != "invisible":
				
				button.mouse_entered.connect(func(): _on_hover_item(item))
				button.mouse_exited.connect(_on_unhover_item)
			
			return button
	)

func _unload_inventory():
	for child_index in range(0, get_child_count()-1):
		remove_child(get_child(child_index))

func _on_hover_item(item: ItemDefinition):
	on_hover_item.emit(item)
	ui.tooltip._on_hover_item(item)

func _on_unhover_item():
	on_unhover_item.emit()
	ui.tooltip._on_unhover_item()
