extends Node

var PREFERENCES := IPreferences.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var preferences_json := JsonManager.load_json("res://Configs/preferences.json")
	
	JsonManager.json_to_class(preferences_json, PREFERENCES)
	print(PREFERENCES)
