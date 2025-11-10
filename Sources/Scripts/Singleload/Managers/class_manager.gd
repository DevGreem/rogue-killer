extends Node

func get_class_properties(obj: Object) -> Array:
	
	## Propiedades de los padres y de la clase
	var properties := []
	
	## Script actual
	var script: Script = obj.get_script()
	
	while script:
		
		var script_properties = []
			
		for property in get_only_class_properties(obj):
				
			script_properties.append(property)
			
		properties += script_properties
			
		## Se consigue la clase padre
		script = script.get_base_script()
	
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
