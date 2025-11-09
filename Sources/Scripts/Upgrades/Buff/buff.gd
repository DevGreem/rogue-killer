extends Upgrade

class_name Buff

## Señal que se ejecuta cuando un buff pierde el timer
signal expired
signal actual_time_changed(before: float, now: float)
signal max_time_changed(before: float, now: float)
signal reduce_state_changed(state: bool)

## Duracion actual de buffo
@export var actual_duration: float:
	set(value):
		
		var old_time := actual_duration
		
		actual_duration = clamp(value, 0, max_duration)
		
		actual_time_changed.emit(old_time, actual_duration)

## Duracion maxima del buffo
@export var max_duration: float:
	set(value):
		var old_time = max_duration
		
		max_duration = value
		
		max_time_changed.emit(old_time, max_duration)
		actual_duration = clamp(actual_duration, 0, max_duration)

## Se usa para ver si reduce o no el tiempo
var reduce: bool = true:
	set(value):
		reduce = value
		reduce_state_changed.emit(value)

func _init(_actual_duration: float, _max_duration: float, _reduce: bool = true):

	actual_duration = _actual_duration
	max_duration = _max_duration
	reduce = _reduce

func _process(delta: float) -> void:
	
	if reduce:
		# Reduce la duracion actual
		actual_duration -= delta
	
	if actual_duration <= 0:
		# Al perder el buff, emite una señal de que ya se perdio.
		expired.emit()
		# Se libera de la memoria y se elimina
		self.queue_free()
