@tool
extends Resource

class_name EntityStatData

@export_category("Health")
@export var health: LimitedData

@export_category("Combat")
@export var damage: RangeData
@export var attack_cooldown: float = 1

@export_category("Stamine")
@export var stamine: StamineData

@export_category("Speed")
@export var speed: SpeedData
