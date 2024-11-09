extends StateBase



@export var sprite2D:Sprite2D
@export var texture:Texture

## Cambia sprite
func enter():
	sprite2D.set_texture(texture)
	
