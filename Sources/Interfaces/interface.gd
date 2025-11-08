extends Node

class_name Interface

var _dir: String

func _init(_auto_init: bool = true) -> void:
	
	_dir = get_dir()
	
	if _auto_init:
		_init_subinterfaces()

func load_from(path: String, key = null) -> void:
	
	var json := JsonManager.load_json(path)
	
	JsonManager.json_to_class(json, self, key)

func _init_subinterfaces() -> void:
	
	const INTERFACES_PATH = "res://Sources/Interfaces/"
	
	for property in get_property_list():
		
		var type_name: String = property.class_name
		
		if !type_name || type_name == "" || property.name.begins_with("_"):
			continue
		
		if __is_interface_name(type_name) and type_name != self.get_class():
			
			var type_path_name = type_name.replace("_", "/")
			type_name = type_name.split("_", false)[-1]
			
			var candidate_paths: Array[String] = []
			
			if _dir and _dir != "":
				candidate_paths.append(_dir + "/" + type_name + ".gd")
			
			candidate_paths.append(INTERFACES_PATH + type_path_name + "/" + type_name + ".gd")
			candidate_paths.append(INTERFACES_PATH + type_name + ".gd")
			
			var script_path: String = ""
			
			for path in candidate_paths:
				if FileAccess.file_exists(path):
					script_path = path
					break
			
			var script = load(script_path)
			
			set(property.name, script.new())

func __is_interface_name(string: String) -> bool:
	
	if string.length() < 2:
		return false
	
	var upper_string := string.to_upper()
	
	if !string.begins_with("I"):
		return false
	
	if string[1] != upper_string[1]:
		return false
	
	return true

func to_json() -> Dictionary:
	
	var json := JsonManager.class_to_json(self)
	
	return json

func _to_string() -> String:
	
	var data := to_json()
	
	return JSON.stringify(data, "\t")

func get_dir() -> String:
	return ""
