extends Node

var PREFERENCES := IPreferences.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	__load_config_file("preferences", PREFERENCES)

func __load_config_file(file_name: String, obj: Interface) -> void:
	
	var json = JsonManager.load_json("res://Configs/"+file_name+".json")
	
	JsonManager.json_to_class(json, obj)
