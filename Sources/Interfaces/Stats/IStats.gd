extends IStatBase

class_name IStats

# Si las estadisticas pertenecen a una entidad, esta son las que tiene la entidad.
# Si las estadisticas pertenencen a un objeto/pasiva, son las estadisticas que este otorga a la entidad.

## Vida de la entidad
var health: IRange

## Daño de la entidad u objeto.
var dmg: IRange

## Armadura de la entidad
var armor: float

## Duracion (en segundos) que dura la energia
var stamine_duration: IRange

## Velocidad aumentada al correr (porcentaje)
var run_speed: float

## Cooldown de cada ataque
var attack_cooldown: float
