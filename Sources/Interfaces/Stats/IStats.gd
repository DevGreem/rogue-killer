extends IStatBase

class_name IStats

# Si las estadisticas pertenecen a una entidad, esta son las que tiene la entidad.
# Si las estadisticas pertenencen a un objeto/pasiva, son las estadisticas que este otorga a la entidad.

## Vida de la entidad
@export var health: IRange

## Daño de la entidad u objeto.
var dmg: IRange

## Armadura de la entidad
var armor: float

# Stats de stamina
var stamine: IStamine

var walk_speed: IStat

## Cooldown de cada ataque
var attack_cooldown: float
