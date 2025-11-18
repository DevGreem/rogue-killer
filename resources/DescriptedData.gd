@abstract class_name DescriptedData extends UniqueData

signal on_change_description(before: String, after: String)

@export var description := "":
	set(value):
		
		on_change_description.emit(description, value)
		description = value
