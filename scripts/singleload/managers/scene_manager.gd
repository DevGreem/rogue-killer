extends Node

#region GETs

## Consigue el nombre de una escena
func get_scene_path(scene_name: String) -> String:
	
	var scene_path := Constants.SCENES_PATH+"{name}/{name}.tscn".format({"name":scene_name})
	
	return scene_path

func get_entity_path(entity_path: String) -> String:
	var entity := Constants.ENTITIES_PATH+"{name}.tscn".format({"name":entity_path})
	
	return entity

func get_item_path(item_path: String) -> String:
	
	var item := Constants.ITEMS_PATH+"{name}/{name}.tres".format({"name":item_path})
	
	return item

func get_scene(path: String) -> Node:
	var loaded_scene := load(path)
	
	var instantiated_scene = loaded_scene.instantiate()
	
	return instantiated_scene

#endregion

## Cambia a otra escena
func to_scene(scene: String) -> void:
	
	get_tree().change_scene_to_file(get_scene_path(scene))

## Añade una escena segun el path
func add_scene(path: String, obj: Node = null) -> Object:
	
	var instantiated_scene = get_scene(path)
	
	if obj:
		obj.add_child(instantiated_scene)
	else:
		add_child(instantiated_scene)
	
	return instantiated_scene

## Añade una escena a otra (solo hay que pasarle el nombre)
func add_subscene(scene_name: String, obj: Node = null) -> PackedScene:
	return add_scene(get_scene_path(scene_name), obj)
