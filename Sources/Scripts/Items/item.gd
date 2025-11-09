extends Area2D

class_name Item

@export var data: ItemData
@onready var sprite: Sprite2D

func _ready():
	if data and sprite:
		sprite.texture = data.texture
