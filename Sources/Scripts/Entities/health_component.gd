extends Area2D

class_name HealthComponent

signal on_dead
signal on_damage_took
signal on_health_change(health: float)

@export var actual_health: float:
	get:
		return actual_health
	set(value):
		actual_health = clamp(value, 0, max_health)
		
		if actual_health <= 0:
			die()
			return
		
		on_health_change.emit(actual_health)
		
@export var max_health: float:
	get:
		return max_health
	set(value):
		
		max_health = value
		
		if value < actual_health:
			actual_health = value

func take_damage(damage: float) -> void:
	
	damage = max(damage, 0)
	on_damage_took.emit(damage)
	print(damage)
	
	actual_health -= damage

func die() -> void:
	on_dead.emit()
