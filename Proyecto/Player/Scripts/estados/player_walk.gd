extends PlayerState

## Velocidad de movimiento horizontal
const MOVE_SPEED = 200.0        


## Animacion de caminar
@export var animation:SpriteFrames

## Cambia animacion
func enter() -> void:
	animated_sprite.set_sprite_frames(animation)

## Para velocidad en el eje X
func exit() -> void:
	character_body.velocity.x = 0
	character_body.move_and_slide()

## Aplica movimiento en el eje X via Input
func physics_process(_delta: float) -> void:
	super.physics_process(_delta)
	
	 # Movimiento horizontal
	var velocity: Vector2 = character_body.velocity
	velocity.x = 0  # Reinicia la velocidad horizontal
	if Input.is_action_pressed("Right"):
		velocity.x = MOVE_SPEED
	elif Input.is_action_pressed("Left"):
		velocity.x = -MOVE_SPEED
	
		# Mueve el personaje y detecta colisiones
	character_body.velocity = velocity
	character_body.move_and_slide()
	flip_animation()
	
	# mueve RB2D
	check_and_push_box()
	

## Voltea el eje x de la animacion dependiendo de la velocidad
func flip_animation() -> void:
	if character_body.velocity.x > 0:
		animated_sprite.set_flip_h(false)
	if character_body.velocity.x < 0:
		animated_sprite.set_flip_h(true)
		
## Mueve Rigidbody en el eje x
## Codigo by GPT
func check_and_push_box() -> void:
	var player:CharacterBody2D = _controlled_node()
	print(player.name)
	print(player.get_parent().name)
	# Define a ray starting from the character's position, facing forward
	var ray_origin = player.global_position
	var ray_length = 50.0  # Adjust this based on the interaction range
	var ray_direction = Vector2.RIGHT # Adjust to face in the direction of rotation
	if Input.is_action_pressed("Left"):
		ray_direction = Vector2.LEFT
	
 	# Set up the PhysicsRayQueryParameters2D
	var query_params = PhysicsRayQueryParameters2D.new()
	query_params.from = ray_origin
	query_params.to = ray_origin + ray_direction * ray_length
	query_params.exclude = [self]  # Make sure the character doesn't collide with itself
	
	# Cast the ray to detect any RigidBody2D objects (like the box) in front
	var space_state = player.get_world_2d().direct_space_state
	var result = space_state.intersect_ray(query_params)
	
	# If we hit something
	if result and result.collider is RigidBody2D:
		# Apply a force to the box (rigid body) in the direction the character is facing
		var box : RigidBody2D = result.collider
		box.apply_force(ray_direction  * 1500)




## Cambia de estado al dejar de pular A/D a 'Idle'
func input(_event: InputEvent) -> void:
	super.input(_event)
	if direction_input.x == 0:
		state_machine.change_state_with_name("Idle")
		return
