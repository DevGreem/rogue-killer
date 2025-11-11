@tool
@warning_ignore('missing_tool')

@abstract
class_name TimedData extends LimitedData

@warning_ignore("unused_signal")
signal expired

@export var stopped := false

@abstract func tick(delta: float) -> void
@abstract func is_active() -> bool

func _set_current_value(value: float):
	
	if !stopped:
		super._set_current_value(value)
