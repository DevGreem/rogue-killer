@tool
extends CharacterBody2D

class_name Entity

@export var data: EntityData
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var collision: CollisionShape2D = $EntityCollision

func _ready():
	if data and sprite:
		
		if data.texture:
			sprite.sprite_frames = data.texture
			sprite.animation = "default"
			sprite.play()
	
	#prints("Current stamine:", data.stats.stamine.duration.current_value, "\nMax Stamine:", data.stats.stamine.duration.max_value)

#region STAMINE METHODS

## Recarga la energia del jugador
func reload_stamine(delta: float) -> void:
	
	var stamine := data.stats.stamine
	
	# Verifica si la recarga de energia ya esta completa.
	# Si la recarga de energia es igual al maximo, significa que ya esta completa
	if !stamine.reload.is_active():
		
		# Recarga la duracion de la energia hasta su limite
		stamine.duration.current_value += delta
		#prints("Recargando stamina:", stamine.duration.current_value)
		return
	
	# Si no esta completa, recarga la recarga de energia
	stamine.reload.tick(delta)
	#prints("Recargando recarga de stamina:", stamine.reload.current_value)

## Consume la energia del jugador
func consume_stamine(delta: float):
	var stamine := data.stats.stamine
	#prints("Duration:",stamine.duration.current_value,"\nReload:", stamine.reload.current_value)
	
	# Reduce la duracion de la energia
	stamine.duration.tick(delta)
	#prints("Consumiendo stamina:", delta)
		
	# El tiempo de espera de recarga de la energia vuelve a 0
	# Esto es porque cuando consume energia, tiene que volver a esperar para recargarla.
	stamine.reload.current_value = 0

## Verifica si el jugador tiene energia
func has_stamine() -> bool:
	
	var can_run := data.stats.stamine.duration.is_active()
	
	return can_run

#endregion

func die() -> void:
	queue_free()

func _on_attack():
	pass

func _on_hit(body: Entity):
	
	var damage := data.stats.damage.random_float()
	body.receive_attack(damage)

func receive_attack(damage: float):
	#print("Received damage: ", damage)
	data.stats.health.current_value -= damage
	
	if data.stats.health.current_value <= 0:
		die()
