@tool
extends TimedData

## Datos temporizados, es decir, los que cuentan cuanto tiempo ha pasado
## Estos deberian de empezar con 0 segundos
## Y deben de llegar a [param N] segundos, siendo [param N] el tiempo limite.
class_name TemporizerData

## Aumenta el valor de [param current_value] segun delta
## Si [param current_value] [color=red]>=[/color] [param max_value], emite el signal expired.
func tick(delta: float) -> void:
	current_value += delta
	
	if !is_active():
		expired.emit()

## Devuelve [color=green]true[/color] si current_value es menor que max_value
func is_active() -> bool:
	return current_value < max_value
