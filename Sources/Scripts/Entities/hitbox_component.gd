extends Area2D

class_name HitboxComponent

signal on_attack(damage: float, to_area: Area2D)

@export var min_damage: float
@export var max_damage: float
@export var attack_timer: float

func _ready():
	monitoring = false

func _input(event):
	
	if event is InputEventMouseButton and event.pressed:
		monitoring = true
		print("Atacando!")

func hit(area):
	
	if area is HealthComponent:
		
		var real_damage := randf_range(min_damage, max_damage)
		
		area.take_damage(real_damage)
		
		on_attack.emit(real_damage, area)

func _on_area_entered(area: Area2D) -> void:
	hit(area)

#func _physics_process(delta: float) -> void:
	#
	#attack_timer -= delta
	#if Input.is_action_just_pressed("Attack") and attack_timer <= 0:
		#perform_attack()
		#attack_timer = stats.attack_cooldown
		#print("Atacado!")
#
#func perform_attack() -> void:
	#
	## var attack_area = Area2D.new()
	#
	##add_child()
	#pass
