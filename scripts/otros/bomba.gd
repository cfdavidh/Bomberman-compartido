extends Node2D

@onready var timer: Timer = $Timer
@onready var ray1: RayCast2D = $RayCast2D
@onready var ray2: RayCast2D = $RayCast2D2
@onready var ray3: RayCast2D = $RayCast2D3
@onready var ray4: RayCast2D = $RayCast2D4
var bandera1 = true
var bandera2 = true
var bandera3 = true
var bandera4 = true

func _ready() -> void:
	timer.start(1.5)
	


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
	match anotador:
		1:
			bandera1 = false
		2:
			bandera2 = false
		3:
			bandera3 = false
		4:
			bandera4 = false
	
	GLOBAL.coordenadas.append(rayc.get_collision_point())
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
	lengthen_raycast_1(ray1)
	lengthen_raycast_2(ray2)
	lengthen_raycast_3(ray3)
	lengthen_raycast_4(ray4)
	
	
	await get_tree().create_timer(2).timeout
	self.queue_free()
