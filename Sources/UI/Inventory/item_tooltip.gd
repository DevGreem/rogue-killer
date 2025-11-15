extends RichTextLabel

class_name ItemTooltip

signal on_show_tooltip(item: ItemDefinition)
signal on_close_tooltip

func _ready():
	z_index = 1000

func _on_hover_item(item: ItemDefinition):
	
	text = "{name}\n{description}".format({
		"name": item.name,
		"description": item.description
	})
	global_position = get_global_mouse_position()
	
	show()
	on_show_tooltip.emit(item)

func _on_unhover_item():
	hide()
	on_close_tooltip.emit()
