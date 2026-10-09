# Hereda de Camera3D para controlar el comportamiento del objeto de cámara en la escena 3D
extends Camera3D

# Expone la variable 'velocidad' en el Inspector de Godot para ajustarla sin tocar el código
# @export permite editarla desde la interfaz; float define un número con decimales
@export var velocidad : float = 10.0

# Se ejecuta automáticamente en cada fotograma del juego (frame por frame)
func _process(delta: float) -> void:
	# Inicializa un vector tridimensional nulo (x=0, y=0, z=0) para almacenar la dirección del movimiento
	var dir = Vector3.ZERO
	
	# Detección de teclas para el plano horizontal y vertical:
	if Input.is_key_pressed(KEY_W): dir.z -= 1  # Avanzar hacia adelante (eje Z negativo en Godot 3D)
	if Input.is_key_pressed(KEY_S): dir.z += 1  # Retroceder hacia atrás (eje Z positivo)
	if Input.is_key_pressed(KEY_A): dir.x -= 1  # Desplazarse a la izquierda (eje X negativo)
	if Input.is_key_pressed(KEY_D): dir.x += 1  # Desplazarse a la derecha (eje X positivo)
	if Input.is_key_pressed(KEY_E): dir.y += 1  # Elevar la cámara (eje Y positivo)
	if Input.is_key_pressed(KEY_Q): dir.y -= 1  # Bajar la cámara (eje Y negativo)
	
	# Aplica el movimiento suave:
	# .normalized() evita que la cámara vaya más rápido al moverse en diagonal
	# * velocidad define la rapidez
	# * delta independiza el movimiento de los FPS de la pantalla
	translate(dir.normalized() * velocidad * delta)
