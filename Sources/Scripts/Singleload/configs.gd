extends Node

var PREFERENCES := IPreferences.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var preferences_json := JsonManager.load_json("res://Configs/preferences.json")
	
	JsonManager.json_to_class(preferences_json, PREFERENCES)
	
	print(JsonManager.class_to_json(PREFERENCES))
	
	var test := IControls.new()
	var test_json := JsonManager.load_json("res://Configs/test.json")
	
	JsonManager.json_to_class(test_json, test)
	
	print(ClassManager.get_class_properties(test))
