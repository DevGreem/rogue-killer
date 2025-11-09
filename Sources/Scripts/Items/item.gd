extends Area2D

class_name Item

@export var data: ItemData
@onready var sprite: Sprite2D = $Node2D

func _ready():
	if data and sprite:
		sprite.texture = data.texture

func collect_item():
	queue_free()
