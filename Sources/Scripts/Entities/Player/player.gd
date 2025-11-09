extends Entity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var real_speed = stats.walk_speed
	
	# Si el personaje esta corriendo, modifica la velocidad
	if is_running(delta):
		real_speed *= stats.run_speed
	
	# Cambia la velocidad del personaje
	velocity.x = UserInput.get_axis().x * real_speed * delta
	velocity.y = UserInput.get_axis().y * -real_speed * delta
	
	move_and_slide()

## Verifica si el jugador esta corriendo
func is_running(delta: float) -> bool:
	
	# Si la recarga de energia es igual a su valor maximo
	# Empieza a recarga la energia
	if stats.stamine.reload.current == stats.stamine.reload.max_value:
		# Se suma delta para que concuerde con el tiempo
		stats.stamine.duration.current += delta
	
	# Si esta presionando el shift, hace que el personaje corra
	if Input.is_key_pressed(KEY_SHIFT):
		
		# Si la duracion de la energia es <= 0, no corre
		if stats.stamine.duration.current <= 0:
			return false
		
		print(stats.stamine.duration)
		
		# Si corre, elimina el tiempo en el que esta corriendo a la duracion
		# Para bajar la cantidad de energia faltante
		stats.stamine.duration.current -= delta
		# El tiempo de espera de recarga de la energia vuelve a 0
		stats.stamine.reload.current = 0
		return true
	
	# Si no corre, vuelve a cargar el tiempo de recarga de la stamina
	stats.stamine.reload.current += delta
	return false

func _input(event):
	
	if event is InputEventMouse:
		
		var direction = event.position
		
		look_at(direction)


func _on_dead() -> void:
	queue_free()
