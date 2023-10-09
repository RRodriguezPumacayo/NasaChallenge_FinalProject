extends AudioStreamPlayer

# Esta función se llama cuando se inicializa el nodo
func _ready():
	# Reproduce el sonido en bucle mientras estás en el menú
	play()

# Esta función se llama cuando el sonido ha terminado de reproducirse
func _on_sound_finished():
	# Vuelve a reproducir el sonido en bucle cuando ha terminado de reproducirse
	play()

# Esta función detiene la reproducción del sonido
func stop_sound():
	stop()
