extends UniqueDictionary

class_name PassiveManager

func _init(passives: Dictionary[String, Upgrade] = {}):
	super._init(passives)

func get_passive(id: String) -> Upgrade:
	return _get_object(id)

func add_passive(passive: Upgrade) -> void:
	_add_object(passive)

func remove_passive(id: String) -> void:
	_remove_object(id)
