extends Node

const SCENES_PATH := "res://Sources/Scenes/"
const ENTITIES_PATH := "res://Sources/Entities/"

## Consigue el nombre de una escena
func get_scene_path(scene_name: String) -> String:
	
	var scene_path := SCENES_PATH+"{name}/{name}.tscn".format({"name":scene_name})
	
	return scene_path

## Cambia a otra escena
func to_scene(scene: String) -> void:
	
	get_tree().change_scene_to_file(get_scene_path(scene))

## Añade una escena segun el path
func add_scene(path: String, obj: Node = null) -> Object:
	
	var loaded_scene: PackedScene = load(path)
	
	var instantiated_scene = loaded_scene.instantiate()
	
	if obj:
		obj.add_child(instantiated_scene)
	else:
		add_child(instantiated_scene)
	
	return instantiated_scene

## Añade una escena a otra (solo hay que pasarle el nombre)
func add_subscene(scene_name: String, obj: Node = null) -> PackedScene:
	return add_scene(get_scene_path(scene_name), obj)

func get_entity_path(entity_path: String) -> String:
	var entity := ENTITIES_PATH+"{name}.tscn".format({"name":entity_path})
	
	return entity

## Añade una entidad a una escena (Tiene que poner la ruta de archivos)
func add_entity(entity_name: String, obj: Node = null) -> Object:
	return add_scene(get_entity_path(entity_name), obj)
