extends GridInventory

class_name EntityInventory

func _ready():
	
	for y in range(0, size.x):
		for x in range(0, size.y):
			
			var position := Vector2(x, y)
			set_tile(position, "empty")

#region METHODS

## Devuelve la informacion del objeto en el stack
func _get_item_from_stack(stack: ItemStack) -> ItemDefinition:
	return database.get_item(stack.item_id)

## Consigue el valor de la posicion proporcionada
func get_item(position: Vector2) -> ItemDefinition:
	var stack = get_stack_at(position)
		
	return _get_item_from_stack(stack)

## Cambia el valor de la posicion proporcionada
func set_tile(position: Vector2, item_id: String, amount := 1, properties := {}, is_rotated := false) -> void:
	
	if get_stack_at(position) == null:
		add_at_position(position, item_id, amount, properties, is_rotated)
	
	#set_stack_content(
		#get_stack_index_at(position),
		#item_id,
		#amount,
		#properties
	#)

#endregion
