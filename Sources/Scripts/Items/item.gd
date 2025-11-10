@tool
extends Area2D

class_name Item

@export var data: ItemData
@onready var sprite: AnimatedSprite2D = $Sprite

func _ready():
	if data and sprite:
		# TODO: Hacer un SpriteManager que las entidades y objetos puedan reutilizar
		sprite.sprite_frames = data.texture
		sprite.animation = "default"
		sprite.play()

func collect_item():
	queue_free()
