extends Node

class_name Interface

var _dir: String

func _init() -> void:
	
	_init_subinterfaces()

func _init_subinterfaces() -> void:
	
	const interfaces_path = "res://Sources/Interfaces/"
	
	for property in get_property_list():
		
		var type_name: String = property.class_name
		
		if !type_name || type_name == get_class() || property.name.begins_with("_"):
			continue
		
		#if property.type != TYPE_OBJECT:
			#set(property.)
		
		if type_name.begins_with("I"):
			
			var script_path: String = interfaces_path+type_name+"/"+type_name+".gd"
			
			if _dir:
				script_path = _dir
			elif FileAccess.file_exists(interfaces_path+type_name+".gd"):
				
				script_path = interfaces_path+type_name+".gd"
			
			var script = load(script_path)
			
			set(property.name, script.new())

func to_json() -> Dictionary:
	
	return {}

func _to_string() -> String:
	
	var data := {}
	
	for property in get_property_list():
		
		if property.name.begins_with("_"):
			continue
		
		var value = get(property.name)
		
		if value is Interface:
			data[property.name] = JSON.parse_string(value._to_string())
		else:
			data[property.name] = value
	
	return JSON.stringify(data, "\t")
