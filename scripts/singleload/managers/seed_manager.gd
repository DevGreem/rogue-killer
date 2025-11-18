extends Node

var rng: RandomNumberGenerator

func _ready():
	rng = RandomNumberGenerator.new()

func generate_new_seed() -> int:
	rng.randomize()
	return rng.seed

func random_choose(array: Array):
	
	var rand_number := rng.randi_range(0, array.size())
	
	var choice = array[rand_number]
	
	return choice
