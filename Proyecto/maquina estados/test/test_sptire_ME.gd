extends StateBase

@export var sprite:Sprite2D
@export var next_state:StateBase

## esconde sprite
func _ready():
	sprite.visible = false

## muestra srpite, tras 3s cambia de estado
func enter():
	print("Enter Test "+sprite.name)
	sprite.visible = true
	await get_tree().create_timer(3).timeout
	state_machine.change_state(next_state)

## esconde sprite
func exit():
	print("Exit Test "+sprite.name)
	sprite.visible = false
