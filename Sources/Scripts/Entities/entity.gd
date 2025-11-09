extends Node

class_name Entity

var passive: Array[Upgrade]
var buffs: Array[Buff]
var money: int
@onready var stats: StatsComponent = $Stats

func receive_attack(amount: int) -> void:
	
	var damage = max(amount - stats.armor, 0)
	
	stats.add_to_stat(Enums.StatType.HEALTH,-damage) 
	
	if stats.health.min_value <= 0:
		die()

func die() -> void:
	queue_free()
