extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pressed.connect(func(): JsonManager.write_json_file("res://Configs/preferences.json", {"Testeo": KEY_B}))
