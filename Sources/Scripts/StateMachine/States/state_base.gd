@abstract class_name StateBase extends Node

@onready var state_owner: Node = owner

var state_machine: StateMachine

@abstract func start()
@abstract func end()
