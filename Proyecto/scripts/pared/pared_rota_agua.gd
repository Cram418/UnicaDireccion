extends StateBase


@export var arbol_estado_2:Node
@export var sprite2D:Sprite2D
@export var texture:Texture

## cambia sprite
## notifica al arbol que puede crezer sano
func enter():
	sprite2D.set_texture(texture)
	arbol_estado_2.agua_rociada = true
	print("TODO, hacer que el arbol sepa que crezca sano")
