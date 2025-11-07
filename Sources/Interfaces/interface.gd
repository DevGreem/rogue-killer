extends Node

class_name Interface

func _init() -> void:
	
	_init_subinterfaces()

func _init_subinterfaces() -> void:
	
	const interfaces_path = "res://Sources/Interfaces/"
	
	for property in get_property_list():
		
		var type_name: String = property.class_name
		
		if !type_name || type_name == "" || property.name.begins_with("_"):
			continue
		
		if type_name.begins_with("I") and type_name != self.get_class():
			
			var script_path: String = interfaces_path+type_name+"/"+type_name+".gd"
				
			if FileAccess.file_exists(interfaces_path+type_name+".gd"):
				
				script_path = interfaces_path+type_name+".gd"
			
			var script = load(script_path)
			
			set(property.name, script.new())

func to_json() -> Dictionary:
	
	var json := JsonManager.class_to_json(self)
	
	return json

func _to_string() -> String:
	
	var data := to_json()
	
	return JSON.stringify(data, "\t")
