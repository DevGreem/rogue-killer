extends Interface

class_name IRange

var min_value: float:
	get:
		return min_value
		
	set(value):
		if limit_max and max_value != 0.0 and max_value:
			min_value = min(max_value, value)
			return
		
		min_value = value

var max_value: float
var limit_max: bool

func _init(_min = null, _max = null, _limit_max: bool = true) -> void:
	
	if _max:
		max_value = _max
	
	if _min:
		min_value = _min

	limit_max = _limit_max
	
func is_in_range(value: float) -> bool:
	
	return value >= min_value and value <= max_value
