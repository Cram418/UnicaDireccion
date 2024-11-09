extends StateBase


@export var sistema_dias:Node
@export var body_arbol_sano:StaticBody2D


func enter():
	body_arbol_sano.set_collision_layer_value(1, false) 
	body_arbol_sano.set_collision_mask_value(1,false)

## cambia estado en el ida y hora correcto
func update(delta: float) ->void:
	if sistema_dias.get_dia() == 3:
		if sistema_dias.get_hora() == 10:
			state_machine.change_state_with_name("Estado 2")
			print("TODO cambiar a arbol muerto")
