class_name StateMachine extends Node

## Nodo que controla la maquina de estados
@onready var controlled_node:Node = self.owner

## Estado por defecto
@export var default_state: StateBase

## Estado actual
var current_state:StateBase = null

#region Inicializar Maquina Estado

## comienza el estado por defecto
func _ready():
	call_deferred("_start_default_state")


func _start_default_state():
	change_state(default_state)
	
#endregion
	
## Cambia al nuevo estado, llamando a `exit` en el estado actual y `enter` en el nuevo
## El estado es un nodo con el nombre dado
func change_state_with_name(name_state: String) -> void:
	change_state(get_node(name_state))
	
## Cambia al nuevo estado, llamando a `exit` en el estado actual y `enter` en el nuevo
func change_state(node_state: StateBase) -> void:
	
	#catch error
	if node_state == null:
		push_warning("Tring to change the state, but the new state is null")
		return
		
	# exit
	if current_state and current_state.has_method("exit"):
		current_state.exit()
	
	# cambia valores
	current_state = node_state
	current_state.state_machine = self
	
	# enter
	if current_state.has_method("enter"):
		current_state.enter()


#region Eventos

func _process(delta: float) -> void:
	if current_state and current_state.has_method("update"):
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state and current_state.has_method("physics_process"):
		current_state.physics_process(delta)

func _input(event: InputEvent) -> void:
	if current_state and current_state.has_method("input"):
		current_state.input(event)

func _unhandled_input(event:InputEvent) -> void:
	if current_state and current_state.has_method("unhandled_input"):
		current_state.unhandled_input(event)
		
func _unhandled_key_input(event:InputEvent) -> void:
	if current_state and current_state.has_method("unhandled_key_input"):
		current_state.unhandled_key_input(event)


#endregion
