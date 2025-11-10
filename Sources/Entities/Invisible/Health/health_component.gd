extends Area2D

class_name HealthComponent

signal on_dead
signal on_damage_took

func send_damage(damage: float) -> void:
	
	damage = max(damage, 0)
	on_damage_took.emit(damage)

func die() -> void:
	on_dead.emit()
