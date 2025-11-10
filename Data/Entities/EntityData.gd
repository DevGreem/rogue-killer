extends Resource

class_name EntityData

## Estadisticas reales de la entidad
@export var stats: EntityStatData

## Modificadores de estadisticas de la entidad
@export var stats_modifier: StatsModifierData

## Pasivas de la entidad por defecto
@export var passive: Array[UpgradeData] = []

## Buffs de la entidad por defecto
@export var buffs: Array[BuffData] = []

## Dinero de la entidad
@export var money: int = 0

## Velocidad al correr de la entidad
@export var run_speed: float = 1.0

@export var texture: SpriteFrames
