extends Resource

class_name StackSizeData

signal on_change_stack(before: int, after: int)
signal on_change_max_stack(before: int, after: int)

@export var actual_stack := 0:
	set(value):
		on_change_stack.emit(actual_stack, value)
		actual_stack = clamp(value, 0, max_stack)
		
@export var max_stack := 1:
	set(value):
		on_change_max_stack.emit(max_stack, value)
		max_stack = value
		
		if actual_stack > max_stack:
			actual_stack = max_stack
