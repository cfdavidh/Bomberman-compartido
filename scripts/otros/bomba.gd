extends Node2D

@onready var jugador: CharacterBody2D = self.get_parent().find_child("Jugador")
@onready var timer: Timer = $Timer
@onready var ray1: RayCast2D = $Arriba
@onready var ray2: RayCast2D = $Abajo
@onready var ray3: RayCast2D = $Derecha
@onready var ray4: RayCast2D = $Izquierda
var bandera1 = true
var bandera2 = true
var bandera3 = true
var bandera4 = true


func _ready() -> void:
	timer.start(1.5)
	GLOBAL.bomba_si = true


func _physics_process(delta: float) -> void:
	if bandera1:
		var anotador = 1
		if ray1.is_colliding(): 
			borrar_array(ray1, anotador)
	if bandera2:
		var anotador = 2
		if ray2.is_colliding(): 
			borrar_array(ray2, anotador)
	if bandera3:
		var anotador = 3
		if ray3.is_colliding(): 
			borrar_array(ray3, anotador)
	if bandera4:
		var anotador = 4
		if ray4.is_colliding(): 
			borrar_array(ray4, anotador)



func borrar_array(rayc, anotador):
	var collition = rayc.get_collision_point()
	var collition_whit =  rayc.get_collider().is_in_group("pared")
	
	match anotador:
		1:
			bandera1 = false
			collition.y -= 8
		2:
			bandera2 = false
			collition.y += 8
		3:
			bandera3 = false
			collition.x += 8
		4:
			bandera4 = false
			collition.x -= 8
	
	if collition_whit:
		print(rayc.get_collision_point(), rayc.get_collider(), "colicionó con", rayc )
		rayc.queue_free()
		return
	else:
		GLOBAL.coordenadas.append(collition)
		print(rayc.get_collision_point(), rayc.get_collider(), "colicionó con", rayc )
		rayc.queue_free()
	

func lengthen_raycast_1(rayc):
	var tween:Tween = get_tree().create_tween()
	tween.tween_property(rayc, "target_position", Vector2(0,-32), 0.5)

func lengthen_raycast_3(rayc):
	var tween:Tween = create_tween()
	tween.tween_property(rayc, "target_position",Vector2(32,0), 0.5)

func lengthen_raycast_2(rayc):
	var tween:Tween = create_tween()
	tween.tween_property(rayc, "target_position",Vector2(0,32), 0.5)

func lengthen_raycast_4(rayc):
	var tween:Tween = create_tween()
	tween.tween_property(rayc, "target_position",Vector2(-32,0), 0.5)

func _on_timer_timeout() -> void:
	
	if GLOBAL.player_position == GLOBAL.bomb_position:
		print("jugador borrado")
		#jugador.queue_free()
	
	ray1.enabled = true
	ray2.enabled = true
	ray3.enabled = true
	ray4.enabled = true
	
	lengthen_raycast_1(ray1)
	lengthen_raycast_2(ray2)
	lengthen_raycast_3(ray3)
	lengthen_raycast_4(ray4)
	
	
	await get_tree().create_timer(2).timeout
	GLOBAL.bomb_position = Vector2i(-20,-20)
	self.queue_free()
