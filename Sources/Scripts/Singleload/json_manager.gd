extends Node

func __parse_error_json(json: JSON, content: String) -> Dictionary[String, Variant]:
	
	var error: Error = json.parse(content)
	
	# Si no hay error al parsear el json, devuelve sus datos
	if error == OK:
		return json.data as Dictionary[String, Variant]
	
	# Si da error, muestra un mensaje en el debugger y devuelve un json vacio
	push_error(
		"JSON Parse Error: ",
		json.get_error_message(),
		" in ", content, " at line ",
		json.get_error_line()
	)
	return {}

## Lee un archivo json y lo devuelve como diccionario
func load_json(path: String) -> Dictionary[String, Variant]:
	
	# Lee el archivo JSON
	var content: String = FileManager.load_file(path)
	
	# Crea una instancia de la clase JSON
	var json: JSON = JSON.new()
	
	# Ejecuta la funcion __parse_error_json y devuelve su value
	return __parse_error_json(json, content)

## Convierte un string de un json a una clase cualquiera
func json_str_to_class(json_str: String, obj: Variant):
	
	# Parsea el string
	var data: Dictionary = JSON.parse_string(json_str)
	
	# Si el parseo es null, devuelve nada
	if data == null:
		return
	
	# Si no  es null, ejecuta la funcion json_to_class y devuelve su valor
	return json_to_class(data, obj)

func json_to_class(json: Dictionary, obj: Variant):
	
	# Revisa cada key del json
	for key in json.keys():
		
		if not obj.has_variable(key):
			push_error(
				"The key: ", key,
				" Don't exists in the class ", typeof(obj)
			)
			return null
		
		var value = json[key]
		var current_value = obj.get(key)
		
		if typeof(value) == TYPE_DICTIONARY:
			json_to_class(value, current_value)
			continue
		
		obj.set(key, value)
	
	return obj

## Edita completamente un archivo json y guarda un diccionario
func write_json_file(path: String, json: Dictionary) -> void:
	
	FileManager.save_in_file(path, JSON.stringify(json, "\t"))
