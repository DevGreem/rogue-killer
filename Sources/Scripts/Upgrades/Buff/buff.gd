extends Upgrade

class_name Buff

## Señal que se ejecuta cuando un buff pierde el timer
signal on_lose

## Duracion del buffo, min_value es la duracion actual
var duration: IRange

## Se usa para ver si reduce o no el tiempo
var reduce: bool = true

func _init(_duration: IRange, _reduce: bool = true):

	duration = _duration
	reduce = _reduce

func _process(delta: float) -> void:
	
	if reduce:
		# Reduce la duracion actual
		duration.min_value -= delta
	
	if duration.min_value <= 0:
		# Al perder el buff, emite una señal de que ya se perdio.
		on_lose.emit(true)
		# Se libera de la memoria y se elimina
		self.free()

func add_duration(value: float) -> void:
	
	
	var sum_value = duration.min_value + value
	
	# Si max_value es -1 significa que no tiene tiempo limite
	if duration.max_value != -1:
		
		# Si sum_value se pasa del limite, elige el limite
		duration.min_value = min(duration.max_value, sum_value)
		return
	
	duration.min_value = sum_value

func add_max_duration(value: float) -> void:
	duration.max_value += value
