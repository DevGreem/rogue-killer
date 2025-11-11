extends Area2D

class_name HitboxComponent

signal on_attack
signal on_hit(body: Node2D)
signal on_finish

@export var can_damage_self: bool = false

func _on_body_entered(body: Node2D) -> void:
	
	on_attack.emit()
	
	if not body.is_in_group("Entities"):
		return
	
	if body == get_parent() and not can_damage_self:
		return
	
	on_hit.emit(body)

func stop(time := 0.0):
	
	await get_tree().create_timer(time).timeout
	on_finish.emit()
	queue_free()
