class_name PlayerState extends StateBase

## Character Body 2D del jugador
@export var character_body: CharacterBody2D
## Animated Sprite del jugador
@export var animated_sprite: AnimatedSprite2D

## Fuerza gravedad
const GRAVITY = 240.0     
##Fuerza de salto (negativa para saltar hacia arriba)
const JUMP_FORCE = -200.0             

## direction de las teclas AWSD
var direction_input = Vector2.ZERO

## Aplica la gravedad
## Salta
func physics_process(_delta: float) -> void:
	
	var velocity: Vector2 = character_body.velocity
	# Aplicar gravedad
	if !character_body.is_on_floor():
		velocity.y += GRAVITY * _delta  # Aumenta la velocidad en el eje Y para simular caída
	else:
		velocity.y = 0  # Reinicia la velocidad en Y si estamos en el suelo

	# Mueve el personaje y detecta colisiones
	character_body.velocity = velocity
	character_body.move_and_slide()

	#salta
	jump()

## Detecta si AWDS son pulsados
func input(_event: InputEvent):
	direction_input = Input.get_vector("Left", "Right", "Up", "Down")
	
## Funcion encargada de realizar el salto
## Esto deberia estar en el estado 'Jump' pero por simpleza lo pondre como funcion general
func jump() -> void:
	# Salto
	var velocity: Vector2 = character_body.velocity
	if Input.is_action_just_pressed("Up") and character_body.is_on_floor():
		velocity.y = JUMP_FORCE  # Aplica la fuerza de salto
	character_body.velocity = velocity
	character_body.move_and_slide()
	
