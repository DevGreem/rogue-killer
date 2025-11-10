extends UpgradeData

class_name BuffData

## Señal que se ejecuta cuando un buff pierde el timer
signal reduce_state_changed(state: bool)

@export var duration: TimerData = TimerData.new()

## Se usa para ver si reduce o no el tiempo
var reduce: bool = true:
	set(value):
		reduce = value
		reduce_state_changed.emit(value)

## Solo reduce el temporizador si reduce es true
func tick(delta: float):
	
	if reduce:
		duration.tick(delta)
