extends Node

class_name UniqueDictionary

signal on_add_object(object: UniqueObject)
signal on_remove_object(object: UniqueObject)

var _dict: Dictionary[Variant, Variant]

func _init(__dict: Dictionary[Variant, Variant] = {}):
	_dict = __dict

func _get_object(id: String) -> UniqueObject:
	
	var value = _dict.get(id)
	
	if !value:
		push_warning("Trying get non-existent object with id: %s" % id)
		return
		
	return value

func _add_object(object: UniqueObject) -> void:
	_dict[object.ID] = object
	
	on_add_object.emit(object)

func _remove_object(id: String) -> void:
	
	var object = _get_object(id)
	
	if !object:
		push_error("Trying remove non-existent object with id: %s" % id)
		return
	
	_dict.erase(id)
	
	on_remove_object.emit(object)
