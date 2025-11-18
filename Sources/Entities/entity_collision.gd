extends CollisionShape2D

class_name SizableCollision2D

func change_size_by_sprite(texture: Texture2D, texture_scale := Vector2(1, 1)):
	
	var sprite_size = texture.get_size()
	
	if shape is RectangleShape2D:
		
		shape.size = sprite_size * texture_scale
	
	shape = shape.duplicate()
