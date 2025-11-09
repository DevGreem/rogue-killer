extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$VBoxContainer/Button.pressed.connect(
		func(): SceneManager.to_scene("History")
	)
	
	$VBoxContainer/Button3.pressed.connect(
		func(): SceneManager.add_scene("ConfigMenu")
	)
	
