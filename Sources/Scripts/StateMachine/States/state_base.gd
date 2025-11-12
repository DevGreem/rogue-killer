@abstract class_name StateBase extends Node

@onready var state_owner: Node = owner

var state_machine: StateMachine

@warning_ignore('unused_signal')
signal on_start

@warning_ignore('unused_signal')
signal on_end

@warning_ignore('unused_parameter')
func start() -> void:
	on_start.emit()
	
func end() -> void:
	on_end.emit()
