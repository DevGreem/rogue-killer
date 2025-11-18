@tool
extends TimedData

## Datos minuteros, es decir, los que cuentan cuanto tiempo falta hasta que se acabe.
## Estos deberian de empezar con [param N] segundos, siendo [param N] el tiempo a contar
## Y deben de llegar a 0 segundos
class_name TimerData

func tick(delta: float) -> void:
	
	current_value -= delta
	
	if !is_active():
		expired.emit()

func is_active() -> bool:
	return current_value > 0
