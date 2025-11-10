extends Resource

class_name RangeData

signal on_change_min_value(before: float, now: float)
signal on_change_max_value(before: float, now: float)

@export_category("Limits")
@export var min_value := 0.0:
	set(value):
		on_change_min_value.emit(min_value, value)
		min_value = min(value, max_value)

@export var max_value := 0.0:
	set(value):
		on_change_max_value.emit(max_value, value)
		max_value = value
		
		min_value = min(min_value, max_value)

func in_range(value: float) -> bool:
	return value >= min_value && value <= max_value

func random_float() -> float:
	return randf_range(min_value, max_value)
