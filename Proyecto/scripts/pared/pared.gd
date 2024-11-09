extends StateBase


@export var sistema_dias:Node
@export var area_pared:Area2D

## comprueba que sea el dia y hora de destruccion 
## si hay un cubo delante destroye le cubo y pasa al estado Pared Rota Agua
## si no pasa al estro Pared Rota
func update(delta: float) ->void:
	if sistema_dias.get_dia() == 4:
		if sistema_dias.get_hora() == 12:
			print("Romper pared")
			if has_cube():
				state_machine.change_state_with_name("Pared Rota Agua")
			else:
				state_machine.change_state_with_name("Pared Rota")


## comprueba si esta el cubo de agua delante y lo destruye
func has_cube() -> bool:
	var bodies_in_area = area_pared.get_overlapping_bodies()
	for body in bodies_in_area:
		if body is RigidBody2D:
			if body.get_meta("Tag") == "Cubo":
				print("RigidBody2D inside the area: ", body.name)
				body.queue_free()
				return true
	return false
