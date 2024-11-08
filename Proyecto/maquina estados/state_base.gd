class_name StateBase extends Node

## maquina de estados que controla este estado
var state_machine:StateMachine

#region Eventos

func enter() -> void:
	pass

func exit() -> void:
	pass
	
func update(_delta:float) -> void:
	pass

func physics_process(_delta: float) -> void:
	pass

func input(_event: InputEvent) -> void:
	pass

func unhandled_input(_event:InputEvent) -> void:
	pass
		
func unhandled_key_input(_event:InputEvent) -> void:
	pass

#endregion

## Nodo que controla la maquina de estados
func _controlled_node() -> Node:
	return state_machine.controlled_node
