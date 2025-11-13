extends Resource

class_name ValueData

signal on_change_buy_value(before: float, now: float)
signal on_change_sell_value(before: float, now: float)

@export var buy := 0.0:
	set(value):
		on_change_buy_value.emit(buy, value)
		buy = value

@export var sell := 0.0:
	set(value):
		on_change_sell_value.emit(sell, value)
		sell = value
