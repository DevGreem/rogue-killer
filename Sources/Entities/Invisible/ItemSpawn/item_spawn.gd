extends Node2D

func _ready():
	
	# Guarda todos los archivos de items (son .tres)
	var items_files: Array[String] = get_items_files()
	print(items_files)
	
	var selected_item := select_random_item(items_files)
	
	print(selected_item)
	add_child(selected_item)

func get_items_files(path: String = Constants.ITEMS_PATH) -> Array[String]:
	
	# Abre la carpeta de items
	var files := DirAccess.open(path)
	
	# Guarda todos los archivos de items (son .tres)
	var items_files: Array[String] = []
	
	if files:
		# Empieza desde el inicio del directorio
		print(files.get_directories())
		print(files.get_files())
		
		var verified_files := ArrayUtilities.filter(
			files.get_files(),
			self.is_item
		)
		
		items_files.append_array(verified_files)
		
		for dir in files.get_directories():
			var sub_items := get_items_files(files.get_current_dir()+"/"+dir)
			print(sub_items)
			items_files.append_array(sub_items)
		
	
	return items_files

func select_random_item(arr: Array[String]) -> Item:
	
	# Genera un RNG
	var rng := RandomNumberGenerator.new()
	
	var cantity := arr.size()
	
	if arr.size() == 0:
		return
	
	var random_item := arr[rng.randi_range(0, cantity-1)]
	
	var item_path := Constants.ITEMS_PATH+random_item.split(".")[0]+"/"+random_item
	print(item_path)
		
	var item_data: ItemData = load(item_path)
	print(item_data)
		
	var item: Item = SceneManager.add_item("TestItem")
	print(item)
	
	item.data = item_data
	
	return item

func is_item(path: String) -> bool:
	
	var file_regex := RegEx.new()
	file_regex.compile("(\\w+)\\.\\w+")
	
	var result = file_regex.search(path)
	
	if result:
		print(result.get_string())
		
		if result.get_string(1) == "database":
			return false
		
		# Si no es un directorio y es un archivo .tres, inserta la ruta en el Array
		if path.ends_with(".tres"):
			return true
		
		return false
	
	return false
