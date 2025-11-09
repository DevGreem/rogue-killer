extends Node

## Cambia a otra escena
func to_scene(scene: String) -> void:
	
	get_tree().change_scene_to_file(get_scene_path(scene))

func add_scene(scene: String) -> void:
	
	var scene_path := get_scene_path(scene)
	
	var loaded_scene: PackedScene = load(scene_path)
	
	add_child(loaded_scene.instantiate())

func get_scene_path(scene_name: String) -> String:
	
	var scene_path := "res://Sources/Scenes/{name}/{name}.tscn".format({"name":scene_name})
	
	return scene_path
