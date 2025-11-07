extends Node

func __parse_error_json(json: JSON, content: String) -> Dictionary:
	
	var result
	
	var error: Error = json.parse(content)
	
	
	if error == OK:
		# Si no hay error al parsear el json, devuelve sus datos
		
		var type_json = typeof(json.data)
		
		if type_json == TYPE_DICTIONARY:
			result = json.data
		else:
			push_error("Expected a Dictionary, but got: ", type_json)
	else:
		# Si da error, muestra un mensaje en el debugger y devuelve un json vacio
		push_error(
			"JSON Parse Error: ",
			json.get_error_message(),
			" in ", content, " at line ",
			json.get_error_line()
		)
	return result

## Lee un archivo json y lo devuelve como diccionario
func load_json(path: String) -> Dictionary:
	
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

func json_to_class(json: Dictionary, obj: Object):
	
	for key in json.keys():
		
		var value = json[key]
		
		if typeof(value) == TYPE_DICTIONARY:
			
			if typeof(obj) == TYPE_DICTIONARY:
				if not obj.has(key) or typeof(obj[key]) != TYPE_DICTIONARY:
					obj[key] = {}
				
				json_to_class(value, obj[key])
			else:
				json_to_class(value, obj.get(key))
		else:
			
			if typeof(obj) == TYPE_DICTIONARY:
				obj[key] = value
			else:
				obj.set(key, value)
	
	return obj

## Convierte una clase a un diccionario
func class_to_json(obj: Object) -> Dictionary:
	
	## Json donde se guardaran los values de la clase
	var json: Dictionary = {}
	
	for property in ClassManager.get_class_properties(obj):
		
		## Valor de la propiedad de la case
		var property_value = obj.get(property.name)
		
		# Evita que sea null
		if property_value == null || typeof(property_value) == TYPE_NIL:
			continue
		
		# Evita que muestre el valor de los archivos a los que pertenecen
		if property.name.ends_with(".gd"):
			continue
		
		# Si es de tipo objeto (otra clase), provoca recursividad
		if typeof(property_value) == TYPE_OBJECT:
			property_value = class_to_json(property_value)
		
		# Añade al diccionario la propiedad
		json.get_or_add(property.name, property_value)
		
	return json

## Edita completamente un archivo json y guarda un diccionario
func write_json_file(path: String, json: Dictionary) -> void:
	
	FileManager.save_in_file(path, JSON.stringify(json, "\t"))
