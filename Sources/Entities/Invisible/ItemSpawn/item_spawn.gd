extends Node2D

func _ready():
	
	var items_dir = "res://Sources/Items/"
	
	var rng := RandomNumberGenerator.new()
	
	var files := DirAccess.open(items_dir)
	
	var items_files: Array[String] = []
	
	if files:
		files.list_dir_begin()
		
		var file: String = files.get_next()
		
		while file != "":
			
			if not files.current_is_dir() and file.ends_with(".tres"):
				items_files.append(file)
			
			file = files.get_next()
		
		files.list_dir_end()
	
	var items_cantity := items_files.size()
	
	if items_cantity > 0:
		var random_item	:= items_files[rng.randi_range(0, items_cantity-1)]
		
		var item_data: ItemData = load(items_dir+random_item)
		
		var item: Item = SceneManager.add_entity("Invisible/ItemSpawn/item_spawn")
		item.data = item_data
		add_child(item)
		
