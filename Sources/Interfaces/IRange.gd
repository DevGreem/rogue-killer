extends Interface

class_name IRange

var min_value: float:
	get:
		return min_value
		
	set(value):
		if limit_max:
			min_value = min(max_value, value)
			return
		
		min_value = value

var max_value: float
var limit_max: bool

func _init(_min: float = 0, _max: float = 0, _limit_max: bool = true) -> void:
	min_value = _min
	max_value = _max
	limit_max = _limit_max

## Evita que el valor actual sobre pase el maximo
func overlimit() -> void:
	
	if limit_max:
		min_value = min(max_value, min_value)
	
func is_in_range(value: float) -> bool:
	
	if value <= min_value || value >= max_value:
		return false
	
	return true
