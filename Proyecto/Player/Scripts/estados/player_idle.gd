extends PlayerState

## Animacion de "idle"
@export var animation:SpriteFrames

## Cambia animacion
func enter() -> void:
	animated_sprite.set_sprite_frames(animation)
	


## Cambia de estado al pulsar A/D a Caminar
func input(_event: InputEvent) -> void:
	super.input(_event)
	if direction_input.x != 0:
		state_machine.change_state_with_name("Walk")
		return
