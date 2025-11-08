extends Entity

signal out_of_space

var equipment: IEquipment

## Inventario donde se guardaran objetos
var inventory: Array[Item]:
	get:
		return inventory
	set(value):
		# Si el nuevo value supera el tamaño limite, no cambia nada y emite una señal
		if value.size() > max_inventory:
			out_of_space.emit(true)
			return
		
		inventory = value

var max_inventory: int
