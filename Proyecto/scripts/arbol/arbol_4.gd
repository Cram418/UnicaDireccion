extends StateBase


@export var body_arbol_sano:StaticBody2D
@export var sprite2D:Sprite2D
@export var texture:Texture

func enter():
	sprite2D.set_texture(texture)
	body_arbol_sano.set_collision_layer_value(1, true) 
	body_arbol_sano.set_collision_mask_value(1,true)
