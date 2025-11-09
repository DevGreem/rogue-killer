extends Resource

class_name StatData

@export_category("Health")
@export var health: LimitedData = LimitedData.new()

@export_category("Combat")
@export var damage: LimitedData = LimitedData.new()
@export var attack_cooldown: float = 1

@export_category("Stamine")
@export var stamine: StamineData = StamineData.new()

@export_category("Speed")
@export var walk_speed: float = 10000
@export var run_speed: float = 1.0
