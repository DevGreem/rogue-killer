extends Area2D

class_name Item

enum ItemType {
	SKIN,
	WEAPON,
	ARMOR_HEAD,
	ARMOR_CHEST,
	ARMOR_FEET
}

enum ItemAction {
	THROWABLE,
	CAN_USE,
	CAN_SELL,
	CAN_DROP,
	CAN_GRAB
}

@export var id: String
@export var description: String
@export var icon: Texture2D
@export var type: ItemType
@export var actions: Array[ItemAction]
@export var stats: IStats
@export var stack: IRange

func collect_item():
	queue_free()
