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
@export var stats: StatsModifierData = StatsModifierData.new()
