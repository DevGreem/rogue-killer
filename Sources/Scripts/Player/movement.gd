extends CharacterBody2D

@export var speed: float
@onready var entity: Node = $PlayerEntity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var real_speed = speed
	
	# Si el personaje esta corriendo, modifica la velocidad
	if is_running(delta):
		real_speed *= entity.stats.stamine.run_speed.modifier
	
	# Cambia la velocidad del personaje
	velocity.x = UserInput.get_axis().x * real_speed * delta
	velocity.y = UserInput.get_axis().y * -real_speed * delta
	
	move_and_slide()

## Verifica si el jugador esta corriendo
func is_running(delta: float) -> bool:
	
	# Si la recarga de energia es igual a su valor maximo
	# Empieza a recarga la energia
	if entity.stats.stamine.reload.min_value == entity.stats.stamine.reload.max_value:
		# delta se multiplica por el modificador de velocidad de recarga, para que sea mas o menos rapido
		entity.stats.stamine.duration.min_value += delta*entity.stats.stamine.reload_speed.modifier
	
	# Si esta presionando el shift, hace que el personaje corra
	if Input.is_key_pressed(KEY_SHIFT):
		
		# Si la duracion de la energia es <= 0, no corre
		if entity.stats.stamine.duration.min_value <= 0:
			return false
		
		print(entity.stats.stamine.duration)
		
		# Si corre, elimina el tiempo en el que esta corriendo a la duracion
		# Para bajar la cantidad de energia faltante
		entity.stats.stamine.duration.min_value -= delta
		# El tiempo de espera de recarga de la energia vuelve a 0
		entity.stats.stamine.reload.min_value = 0
		return true
	
	# Si no corre, vuelve a cargar el tiempo de recarga de la stamina
	entity.stats.stamine.reload.min_value += delta
	return false

func _input(event):
	
	if event is InputEventMouse:
		
		var direction = event.position
		
		look_at(direction)


func _on_dead() -> void:
	queue_free()
