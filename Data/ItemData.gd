extends Resource

class_name ItemData

@export_category("Item Info")
@export var id: String = ""
@export var TYPE: Enums.ItemType = Enums.ItemType.NON_EQUIPABLE
@export var ACTIONS: Array[Enums.ItemAction] = []
@export var description: String = ""
@export var texture: Texture2D

@export_category("Item Stack")
@export var actual_stack: int = 0
@export var max_stack: int = 1
#@export var stats: StatsComponent

func _init(
	_id: String,
	_description: String,
	_type: Enums.ItemType,
	_actions: Array[Enums.ItemAction],
	_actual_stack: int,
	_max_stack: int,
	_texture: Texture2D
):
	id = _id
	description = _description
	TYPE = _type
	ACTIONS = _actions
	actual_stack = _actual_stack
	max_stack = _max_stack
	texture = _texture

#func collect_item():
#	queue_free()
