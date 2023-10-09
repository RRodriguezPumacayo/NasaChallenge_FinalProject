""" extends KinematicBody2D

var VELOCIDAD = 50
var movimiento = Vector2(0,0)
var forgod = true
var GRAVITY = 20
var direccion = 1

var sonidoReproducido = false


func _process(_delta):
	pass


func _physics_process(_delta)->void:
	
	if $dect_izq.is_colliding():
		$Sprite.flip_h = true
		$CollisionShape2D.position.x = -9
		$AnimationPlayer.play("ataqueIzq")
		#$espada.play()
		reproducir_sonido_ataque()
		movimiento.x = 0
		#Global.vida -= 1
		
	
	elif $dect_der.is_colliding():
		$Sprite.flip_h = false
		$CollisionShape2D.position.x = 11
		$AnimationPlayer.play("ataque")
		#$espada.play()
		reproducir_sonido_ataque()
		movimiento.x = 0
		
	else:
		#if is_on_wall():
		if is_on_wall() or not $RayCast2D.get_collider() or not $RayCast2D2.get_collider():
			forgod = not forgod
			#asdasdasdasd
			$Sprite.flip_h = not $Sprite.flip_h 
			
		if forgod == true:
			movimiento.x = VELOCIDAD
			$CollisionShape2D.position.x = 9
			$AnimationPlayer.play("caminar")
	
		else:
			movimiento.x = -VELOCIDAD
			$CollisionShape2D.position.x = 9
			$AnimationPlayer.play("caminar")
			$Sprite.flip_h = true
	
	
	

	
	movimiento.y += GRAVITY
	
	movimiento = move_and_slide(movimiento,Vector2.UP)
	
	movimiento.x = lerp(movimiento.x,0,0.2)
	
func reproducir_sonido_ataque():
	if not sonidoReproducido:
		$espada.play()
		sonidoReproducido = false
	
"""



extends KinematicBody2D

var VELOCIDAD = 50
var movimiento = Vector2(0,0)
var forgod = true
var GRAVITY = 20
var direccion = 1

var sonidoReproducido = false


func _process(_delta):
	pass

func _physics_process(_delta) -> void:
	var raycast_derecha = $RayCast2D
	var raycast_izquierda = $RayCast2D2
	
	if $dect_izq.is_colliding():
		$Sprite.flip_h = true
		$CollisionShape2D.position.x = -9
		$AnimationPlayer.play("ataqueIzq")
		reproducir_sonido_ataque()
		movimiento.x = 0
		#Global.vida -= 1
		
	elif $dect_der.is_colliding():
		$Sprite.flip_h = false
		$CollisionShape2D.position.x = 11
		$AnimationPlayer.play("ataquar")
		reproducir_sonido_ataque()
		movimiento.x = 0
		
	else: 
		if is_on_wall() or not raycast_derecha.is_colliding() or not raycast_izquierda.is_colliding():
			forgod = not forgod
		
		if forgod == true:
			movimiento.x = VELOCIDAD
			$CollisionShape2D.position.x = 9
			$AnimationPlayer.play("caminar")
			$Sprite.flip_h = false
		
		else:
			movimiento.x = -VELOCIDAD
			$CollisionShape2D.position.x = 9
			$AnimationPlayer.play("caminar")
			$Sprite.flip_h = true
			
			
	movimiento.y += GRAVITY
	movimiento = move_and_slide(movimiento, Vector2.UP)
	movimiento.x = lerp(movimiento.x, 0, 0.2)


func reproducir_sonido_ataque():
	if not sonidoReproducido:
		$espada.play()
		sonidoReproducido = false
