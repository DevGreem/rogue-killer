extends Node

func get_class_properties(obj: Object) -> Array:
	
	var properties := []
	var current_class := obj.get_class()
	
	while current_class != "Object" and current_class != "Node":
		
		## Script de la clase
		var script = obj.get_script()
		
		# Si tiene padre, se obtiene la propiedad _base
		if script:
			var script_properties = []
			
			for property in obj.get_property_list():
				
				if property.class_name == current_class:
					script_properties.append(property)
			
			properties += script_properties
			
			## Se consigue la clase padre
			script = script.get_base_script()
			
			if script:
				current_class = script.get_instance_base_type()
				continue
			
			break
		
		else:
			break
	
	return properties

func get_only_class_properties(obj: Object) -> Array:
	
	var class_properties = obj.get_property_list()
	
	var parent_script = obj.get_script().get_base_script()
	
	var parent_properties := []
	
	if parent_script != null:
		
		var parent_obj = parent_script.new()
		
		parent_properties = parent_obj.get_property_list().map(
			func(property): return property.name
		)
		
		parent_obj.free()
	
	var own_props := []
	
	for property in class_properties:
		
		if property.name in ["script", "_script", "resource_name"]:
			continue
		
		if not (property.name in parent_properties):
			own_props.append(property)
	
	return own_props
