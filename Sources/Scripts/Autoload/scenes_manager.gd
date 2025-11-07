extends Node

## Cambia a otra escena
func set_scene(scene_name: String):
	
	get_tree().change_scene_to_file(
		"res://Sources/Scenes/{name}/{name}.tscn".format(
			{
				"name": scene_name
			}
		)
	)
