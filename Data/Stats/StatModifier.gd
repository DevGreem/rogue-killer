extends Resource

class_name StatModifier

signal on_change_flat_value(before: float, now: float)
signal on_change_modifier(before: float, now: float)

## Tipo de estadistica
@export var STAT_TYPE: Enums.StatType

@export_category("Values")
## Valor agregado plano
@export var flat: float = 0:
	set(value):
		on_change_flat_value.emit(flat, value)
		flat = value

## Valor agregado en porcentaje (siempre se usa despues de los valores planos)
@export var modifier: float = 1.0:
	set(value):
		on_change_modifier.emit(modifier, value)
		modifier = value
