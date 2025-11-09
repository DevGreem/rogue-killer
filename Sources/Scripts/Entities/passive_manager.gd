extends Node

class_name PassiveManager

signal on_add_passive(passive: Upgrade)
signal on_remove_passive(passive: Upgrade)

var _passives: Dictionary[String, Upgrade]

func _init(__passives: Dictionary[String, Upgrade] = {}):
	
	_passives = __passives

func get_passive(id: String) -> Upgrade:
	
	return _passives[id]

func add_passive(passive: Upgrade) -> void:
	_passives[passive.ID] = passive
	
	on_add_passive.emit(passive)

func remove_passive(id: String) -> void:
	
	var passive = _passives[id]
	
	_passives.erase(id)
	
	on_remove_passive.emit(passive)
