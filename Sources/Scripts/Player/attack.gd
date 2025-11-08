extends PlayerEntity

var attack_timer: float

func _physics_process(delta: float) -> void:
	
	attack_timer -= delta
	if Input.is_action_just_pressed("Attack") and attack_timer <= 0:
		perform_attack()
		attack_timer = stats.attack_cooldown
		print("Atacado!")

func perform_attack() -> void:
	pass
