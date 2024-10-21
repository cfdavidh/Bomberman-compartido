extends Node2D

@onready var mapa: TileMapLayer = $LevelManager.get_child(0)
const BOMBA = preload("res://escenas/otros/bomba.tscn")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		#var dato = mapa.get_used_cells()
		#print(dato)
		var bomba_instancia = BOMBA.instantiate()
		bomba_instancia.position = mapa.map_to_local(mapa.local_to_map($Jugador.position))
		add_child(bomba_instancia)
		

func _physics_process(delta: float) -> void:
	atlas_coords()

func atlas_coords():
	for i in GLOBAL.coordenadas:
		i.y = i.y - 8
		var coords_borrar = mapa.local_to_map(i)
		mapa.set_cell(coords_borrar, 0, Vector2i(2,0))
		GLOBAL.coordenadas.pop_front()
