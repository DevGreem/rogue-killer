extends Entity

class_name PlayerEntity

func _init():
	stats = IStats.new()
	stats.load_from("res://Configs/character.json", "stats")
 
