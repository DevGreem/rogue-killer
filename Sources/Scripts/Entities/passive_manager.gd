extends UniqueDictionary

class_name PassiveManager

func _init(passives: Dictionary[String, PassiveData] = {}):
	super._init(passives)

func get_passive(id: String) -> PassiveData:
	return _get_object(id)

func add_passive(passive: PassiveData) -> void:
	_add_object(passive)

func remove_passive(id: String) -> void:
	_remove_object(id)
