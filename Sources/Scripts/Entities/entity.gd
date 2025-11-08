extends GameObject

class_name Entity

@export var stats: IStats
var passive: Array[Upgrade]
var buffs: Array[Buff]

func receive_attack(amount: int) -> void:
	
	var damage = max(amount - stats.armor, 0)
	
	stats.health -= damage
	
	if stats.health.min_value <= 0:
		die()

func die() -> void:
	queue_free()
