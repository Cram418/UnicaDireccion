extends StateBase


@export var sistema_dias:Node
@export var sprite2D:Sprite2D
@export var texture:Texture

func enter():
	sprite2D.set_texture(texture)


## cambia estado en el ida y hora correcto
func update(delta: float) ->void:
	if sistema_dias.get_dia() == 9:
		if sistema_dias.get_hora() == 7:
			state_machine.change_state_with_name("Estado 4")
