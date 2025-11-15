extends ItemData

class_name WeaponData

## Ataque minimo y maximo
@export var damage: RangeData

## Tiempo a esperar despues de atacar para poder hacerlo denuevo
@export var cooldown: TimerData

## Tiempo que durara la hitbox del ataque en el escenario
@export var duration: TimerData
