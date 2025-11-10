extends TimedData

class_name TimerData

func tick(delta: float) -> void:
	
	current_value -= delta
	
	if !is_active():
		expired.emit()

func is_active() -> bool:
	return current_value > 0
