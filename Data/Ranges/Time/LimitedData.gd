extends RangeData

class_name LimitedData

signal on_change_current_value(before: float, after: float)

var _current_value := 0.0

@export var current_value: float:
	get:
		return _get_current_value()
	set(value):
		_set_current_value(value)

func _init() -> void:
	on_change_max_value.connect(
		func(_before, _now): current_value = current_value
	)
	
	on_change_min_value.connect(
		func(_before, _now): current_value = current_value
	)

func _get_current_value() -> float:
	return _current_value

func _set_current_value(value: float):
	on_change_current_value.emit(current_value, value)	
		
	_current_value = clamp(value, min_value, max_value)
