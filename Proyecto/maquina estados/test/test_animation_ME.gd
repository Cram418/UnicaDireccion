extends StateBase


@export var animation:AnimatedSprite2D


## crea señal, esconde animacion
func _ready():
	animation.connect("animation_finished", _on_animation_finished)
	animation.visible = false
	animation.set_process(false)
	
## comienza animacion
func enter():
	print("Enter Test A -> B")
	animation.set_process(true)
	animation.visible = true
	animation.play()

## esconde animacion
func exit():
	print("Exit Test A -> B")
	animation.visible = false
	animation.stop()
	animation.set_process(false)

## cambia estado al acabar animacion
func _on_animation_finished() -> void:
	print("End anim")
	state_machine.change_state_with_name(TestStatesNames.SpriteB)


