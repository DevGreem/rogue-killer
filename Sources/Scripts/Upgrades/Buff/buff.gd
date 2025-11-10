extends Node

class_name Buff

@export var data: BuffData = BuffData.new()

func _process(delta: float) -> void:
	
	if data.reduce:
		# Reduce la duracion actual
		data.actual_duration -= delta
	
	data.expired.connect(
		func(): self.queue_free()
	)
