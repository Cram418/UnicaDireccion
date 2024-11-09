extends StateBase

@export var sistema_dias:Node
@export var sprite2D:Sprite2D
@export var texture:Texture

var agua_rociada:bool = false

func enter():
	sprite2D.set_texture(texture)


## cambia estado en el ida y hora correcto
func update(delta: float) ->void:
	if sistema_dias.get_dia() == 6:
		if sistema_dias.get_hora() == 15:
			if agua_rociada:
				state_machine.change_state_with_name("Estado 3")
			else:
				state_machine.change_state_with_name("Estado Muerto")

