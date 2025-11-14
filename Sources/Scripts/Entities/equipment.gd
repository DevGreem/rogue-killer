extends EntityInventory

## Hereda de [GridInventory]
## Sirve para manejar el equipamiento de las entidades
class_name Equipment

#region VARIABLES

## Arma equipada
var weapon: WeaponData:
	get:
		return get_item(Vector2(0, 0))
	set(value):
		set_tile(Vector2(0, 0), value.id)

## Lanzable equipado
var throwable: ThrowableData:
	get:
		return get_item(Vector2(1, 0))
	set(value):
		set_tile(Vector2(1, 0), value.id)

## Mochila equipada
var backpack: BackpackData:
	get:
		return get_item(Vector2(2, 0))
	set(value):
		set_tile(Vector2(2, 0), value.id)

var head: HeadArmorData:
	get:
		return get_item(Vector2(0, 1))
	set(value):
		set_tile(Vector2(0, 1), value.id)

var chest: ChestArmorData:
	get:
		return get_item(Vector2(1, 1))
	set(value):
		set_tile(Vector2(1, 1), value.id)

var feet: FeetArmorData:
	get:
		return get_item(Vector2(2, 1))
	set(value):
		set_tile(Vector2(2, 1), value.id)

#endregion

func _ready() -> void:
	size.x = 3
	size.y = 3
	
	set_tile(Vector2(0, 0), "fist")
	
	for y in range(0, size.y):
		
		var initial = int(y == 0)
		
		for x in range(initial, size.x):
			set_tile(Vector2(y, x), "empty")
