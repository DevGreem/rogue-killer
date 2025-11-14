extends GridContainer

class_name AutoTileContainer

func generate_tiles_from_callable(_size: Vector2, callable: Callable) -> void:
	
	for y in range(0, _size.y):
		for x in range(0, _size.x):
			
			var object: Node = callable.call(x, y)
			
			add_child(object)
