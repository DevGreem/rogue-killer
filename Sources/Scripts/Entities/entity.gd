@tool
extends CharacterBody2D

class_name Entity

@export var data: EntityData
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var collision: CollisionShape2D = $EntityCollision

func _ready():
	sprite.sprite_frames = data.texture
	sprite.animation = "default"
	sprite.play()

func perform_attack():
	var hitbox: HitboxComponent = SceneManager.add_entity("Invisible/Hitbox/hitbox_component", self)
	
	hitbox.on_attack.connect(_on_attack)
	hitbox.on_hit.connect(_on_hit)
	
	var shape = collision.shape
	if shape is RectangleShape2D:
		hitbox.position.x += shape.size.x
	
	await get_tree().create_timer(1).timeout
	hitbox.queue_free()

func receive_attack(damage: float):
	print("Received damage: ", damage)
	data.stats.health.current_value -= damage
	
	if data.stats.health.current_value <= 0:
		die()

func die() -> void:
	queue_free()

func _on_attack():
	pass

func _on_hit(body: Entity):
	
	var damage := data.stats.damage.random_float()
	body.receive_attack(damage)
