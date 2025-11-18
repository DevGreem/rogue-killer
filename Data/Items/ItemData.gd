extends DescriptedData

class_name ItemData

## Nombre del objeto
@export var name: String = ""

@export var icon: SpriteFrames

## Acciones que puede realizar el jugador con el objeto
## Las acciones estan definidas en [enum Enums.ItemAction]
@export var ACTIONS: Array[Enums.ItemAction] = []

## Modificadores de stats del objeto
@export var modifiers: StatsModifierData

## Stack del objeto
## [param min_value] siempre sera 0
## [param max_stack] sera 1 si no se puede stackear el objeto
@export var stack: LimitedData

## Valor del objeto
@export var value: ValueData

## Tamano del objeto en 2D, esto es para saber cuanto espacio ocupa en una mochila
@export var size: Vector2

## Carga un [ItemDefinition] en un [ItemData] para poder usarlo como una clase
func load_definition(item: ItemDefinition) -> void:
	
	var _properties := item.properties
	
	id = item.id
	name = item.name
	description = item.description
	size = item.size
	stack.max_value = item.max_stack if item.can_stack else 1
	
	var props := get_property_list()
	
	for property in props:
		var property_name: String = property["name"]
		property_name = property_name.to_lower()
		
		if !_properties.has(property_name):
			return
		
		set(property_name, _properties[property_name])

## Exporta un [ItemData] a un [ItemDifinition]
func export_definition() -> ItemDefinition:
	
	var item := ItemDefinition.new()
	item.id = id
	item.name = name
	item.description = description
	item.size = size
	item.can_stack = bool(stack.max_value - 1)
	item.max_stack = int(stack.max_value)
	
	var props := get_property_list()
	
	for property in props:
		
		var prop_name: String = property["name"]
		
		item.properties[prop_name] = get(prop_name)
	
	return item
