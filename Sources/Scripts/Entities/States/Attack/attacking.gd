extends StateBase

class_name EntityAttackingAttackState

var entity: Entity

func start():
	entity = state_owner
	perform_attack()

func end():
	pass

func perform_attack():
	#print("Creando hitbox")
	var hitbox: HitboxComponent = SceneManager.add_entity("Invisible/Hitbox/hitbox_component", entity)
	
	#print("Connectando signals de hitbox")
	hitbox.on_attack.connect(_on_attack)
	hitbox.on_hit.connect(_on_hit)
	hitbox.on_finish.connect(_on_finish)
	
	var shape = entity.collision.shape
	if shape is RectangleShape2D:
		hitbox.position.x += shape.size.x
	
	hitbox.stop(1)
	#print("Hitbox eliminada")

func _on_attack():
	pass

func _on_hit(body: Entity):
	
	#print("Cuerpo golpeado")
	var damage := entity.data.stats.damage.random_float()
	body.receive_attack(damage)

func _on_finish():
	#print("Pasando a estado de ataque Idle")
	state_machine.set_state($"../Idle")
