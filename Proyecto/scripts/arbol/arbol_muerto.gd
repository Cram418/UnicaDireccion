extends StateBase

@export var sprite2D:Sprite2D
@export var texture:Texture

func enter():
	sprite2D.set_texture(texture)
