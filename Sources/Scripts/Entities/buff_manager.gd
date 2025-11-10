#extends UniqueDictionary
#
#class_name BuffManager
#
#func _init(buffs: Dictionary[String, Buff] = {}):
	#super._init(buffs)
#
#func get_buff(id: String) -> Buff:
	#return _get_object(id)
#
#func add_buff(buff: Buff) -> void:
	#_add_object(buff)
#
#func remove_buff(id: String) -> void:
	#_remove_object(id)
