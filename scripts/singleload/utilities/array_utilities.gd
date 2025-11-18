extends Node

func filter(arr: Array, callable: Callable) -> Array[Variant]:
	
	var filtered_arr: Array = []
	
	for value in arr:
		var answer: bool = callable.call(value)
		
		if answer:
			filtered_arr.append(value)
	
	return filtered_arr
