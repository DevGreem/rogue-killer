extends EntityIdleAttackState

class_name PlayerIdleAttackState

func _on_input(event: InputEvent):
	
	if event is InputEventMouseButton:
		
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			
			await timer
			
			#print("Click presionado")
			state_machine.set_state($"../Attacking")
