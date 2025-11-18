extends RichTextLabel

class_name ItemTooltip

signal on_show_tooltip(item: ItemDefinition)
signal on_close_tooltip

func _input(_event: InputEvent):
	
	if visible:
		global_position = get_global_mouse_position()
		global_position.y += 20

func _on_hover_item(item_definition: ItemDefinition):
	
	var item := ItemData.new()
	item.load_definition(item_definition)
	
	text = "[b]{name}[/b]\n{description}".format({
		"name": item.name,
		"description": item.description
	})
	fit_content = true
	
	show()
	on_show_tooltip.emit(item)

func _on_unhover_item():
	hide()
	on_close_tooltip.emit()
