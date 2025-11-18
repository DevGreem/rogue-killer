@abstract

extends Node

class_name StateBase

signal on_start
signal on_end

#region VARIABLES

@onready var state_owner: Node = owner

var state_machine: StateMachine

var started: bool = false

#endregion

func start() -> void:
	started = true
	on_start.emit()
	
func end() -> void:
	on_end.emit()
