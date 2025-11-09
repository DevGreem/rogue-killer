extends IStatBase

class_name IStat

## Valor por defecto de la estadistica
var flat: float

## Porcentaje que modificara el valor base
var modifier: float

# Los modificadores siempre se multiplican despues de sumar todos los valores planos
'''
Ejemplo:

flat_1 = 3
flat_2 = 5

modifier_1 = 1.2
modifier_2 = 1.05

return: sum(flat_1, flat_2)*modifier_1*modifier_2
'''
