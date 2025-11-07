extends Node

## Guarda un texto en un archivo (Elimina todo lo que estaba antes en un archivo)
func save_in_file(path: String, content: String) -> void:
	var file = FileAccess.open(path, FileAccess.WRITE)
	
	file.store_string(content)
	file.close()

## Lee todo lo que hay en un archivo y devuelve su contenido
func load_file(path: String) -> String:
	
	var file: FileAccess = FileAccess.open(path, FileAccess.READ)
	
	var content := file.get_as_text()
	file.close()
	
	return content

## Añade un texto a un archivo sin eliminar el que estaba anteriormente.
func append_in_file(path: String, content: String) -> void:
	
	var file_content := load_file(path)
	
	save_in_file(path, file_content + content)
