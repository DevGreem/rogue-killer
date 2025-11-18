@tool
extends Area2D

class_name Item

@export var data: ItemData
@onready var sprite: AnimatedSprite2D = $Sprite

func _ready():
	sprite.sprite_frames_changed.connect(self._on_change_sprite_frames)
	_on_change_sprite_frames()

func _on_change_sprite_frames():
	# TODO: Hacer un SpriteManager que las entidades y objetos puedan reutilizar
	sprite.sprite_frames = data.icon
	sprite.animation = "default"
	sprite.play()

func collect_item():
	queue_free()
