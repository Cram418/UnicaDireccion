extends Node

var dia : int = 1
var hora : int = 6
var minuto : int = 0
var avance_minuto : int = 1

# Referencia al Timer y Label
var timer
var tiempo_label

func _ready():
	# Asegúrate de que la ruta es correcta
	timer = $Timer  # Cambia la ruta si es distinta
	tiempo_label = $Label  # Cambia la ruta si es distinta
	
	# Comprobación para evitar errores de conexión
	if timer:
		timer.wait_time = 1.0
		timer.start()
		timer.connect("timeout",Callable(self, "_on_Timer_timeout"))
	else:
		print("Error: No se encontró el nodo Timer")
	
	if tiempo_label:
		actualizar_tiempo_texto()
	else:
		print("Error: No se encontró el nodo Label")

# Función que se ejecuta cada vez que el Timer se activa
func _on_Timer_timeout():
	avanzar_tiempo(avance_minuto)

# Función para adelantar el tiempo
func avanzar_tiempo(minutos : int):
	minuto += minutos
	if minuto >= 60:
		minuto -= 60
		hora += 1
	if hora >= 24:
		hora -= 24
		dia += 1
	actualizar_tiempo_texto()

# Actualiza el texto del Label
func actualizar_tiempo_texto():
	if tiempo_label:
		tiempo_label.text = "Día: %s | Hora: %02d:%02d" % [dia, hora, minuto]

func _process(delta):
	# Presiona la tecla para adelantar el tiempo (por ejemplo, la tecla "Space")
	if Input.is_action_just_pressed("ui_accept"):
		avanzar_tiempo(60)  # Avanza una hora completa
