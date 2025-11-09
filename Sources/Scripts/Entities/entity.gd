extends CharacterBody2D

class_name Entity

@export var stats: StatData = StatData.new()
@export var stats_modifier: StatsModifierData = StatsModifierData.new()
@export var passive: Array[Upgrade] = []
@export var buffs: Array[Buff] = []
@export var money: int = 0
@export var run_speed: float = 0.0

#func receive_attack(amount: int) -> void:
	#
	#var damage = max(amount - stats.armor, 0)
	#
	#stats.add_to_stat(Enums.StatType.HEALTH, -damage) 
	#
	#if stats.health.min_value <= 0:
		#die()

func die() -> void:
	queue_free()
