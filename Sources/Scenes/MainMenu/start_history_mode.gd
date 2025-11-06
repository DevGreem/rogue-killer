extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# Al presionar el boton que dice "History mode", cambia a la escena de la ruta de abajo.
	pressed.connect(func(): get_tree().change_scene_to_file("res://Sources/Scenes/TestScene.tscn"))
	
