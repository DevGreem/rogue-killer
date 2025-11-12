extends Node

class_name StateMachine

signal changed_state(before: StateBase, after: StateBase)

@onready var machine_owner = owner

@export var default_state: StateBase

var current_state: StateBase = null

func _ready():
	#prints("Machine owner:", machine_owner)
	call_deferred("_state_default_start")

#region Control State

## Inicializa el estado por defecto de la StateMachine
func _state_default_start() -> void:
	current_state = default_state
	_state_start()

## Inicializa el estado actual
func _state_start() -> void:
	#prints("StateMachine", machine_owner.name, "Start state", current_state.name)
	current_state.state_owner = machine_owner
	current_state.state_machine = self
	
	current_state.start()

## Cambia el estado actual por uno nuevo mediante $
func set_state(state: StateBase) -> void:
	
	if current_state == state:
		return
	
	changed_state.emit(current_state, state)
	
	if current_state:
		current_state.end()
	
	current_state = state
	_state_start()

## Cambia el estado actual por uno nuevo mediante un String
func set_state_string(state: String) -> void:
	set_state(get_node(state))

## Verifica si el estado tiene un metodo, si lo tiene, lo ejecuta
func state_has_method(method_name: String, ...args):
	
	if !current_state:
		return
	
	var method := Callable(current_state, method_name)
	
	if current_state.has_method(method_name):
		method.callv(args)
		return

#endregion

#region Methods Section

func _process(delta: float) -> void:
	state_has_method("_on_process", delta)

func _physics_process(delta: float) -> void:
	state_has_method("_on_physics_process", delta)

func _input(event: InputEvent) -> void:
	state_has_method("_on_input", event)

func _unhandled_input(event: InputEvent) -> void:
	state_has_method("_on_unhandled_input", event)

func _unhandled_key_input(event: InputEvent) -> void:
	state_has_method("on_unhandled_key_input", event)

#endregion
