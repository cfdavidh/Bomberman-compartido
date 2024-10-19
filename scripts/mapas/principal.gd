extends Node2D

@onready var mapa: TileMapLayer = $Node2D/Mapa

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		var dato = mapa.get_used_cells()
		print(dato)
