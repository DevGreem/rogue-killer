extends Control

var _config_menu = load("res://Sources/GUI/ConfigMenu/ConfigMenu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$VBoxContainer/Button.pressed.connect(
		func(): SceneManager.to_scene("History")
	)
	
	$VBoxContainer/Button3.pressed.connect(
		func(): add_child(_config_menu.instantiate())
	)
	
