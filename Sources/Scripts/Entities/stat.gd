extends Resource

class_name Stat

signal on_change_flat_value(before: float, now: float)
signal on_change_modifier(before: float, now: float)

## Tipo de estadistica
@export var STAT_TYPE: Enums.StatType

## Valor agregado plano
@export var flat: float:
	set(value):
		on_change_flat_value.emit(flat, value)
		flat = value

## Valor agregado en porcentaje (siempre se usa despues de los valores planos)
@export var modifier: float:
	set(value):
		on_change_modifier.emit(modifier, value)
		modifier = value

func _init(_stat_type: Enums.StatType, _flat: float = 0, _modifier: float = 1.0):
	STAT_TYPE = _stat_type
	flat = _flat
	modifier = _modifier
