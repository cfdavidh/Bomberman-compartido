extends CharacterBody2D
 
@onready var tile_map = $"../LevelManager".get_child(0)
var is_moving = false
var input_dir
var valocidad = 0.5

func _physics_process(delta:float) -> void:
	input_dir = Vector2.ZERO
	
	if Input.is_action_pressed("ui_down"):
		input_dir = Vector2(0, 1)
		move()
	elif Input.is_action_pressed("ui_up"):
		input_dir = Vector2(0, -1)
		move()
	elif Input.is_action_pressed("ui_right"):
		input_dir = Vector2(1, 0)
		move()
	elif Input.is_action_pressed("ui_left"):
		input_dir = Vector2(-1, 0)
		move()


func move():
	if input_dir:
		if is_moving == false:
			is_moving = true
			
			#obtiene la posicion del tile actual
			var current_tile:Vector2i = tile_map.local_to_map(global_position)
			#obtiene la posicion del tile objetivo (a moverse)
			var target_tile:Vector2i = Vector2i(
				current_tile.x + input_dir.x,
				current_tile.y + input_dir.y,
			)
			#obtiene el custom data si es caminable o nó 
			var tile_data:TileData = tile_map.get_cell_tile_data(target_tile)
			#si no es caminable retorna
			if tile_data == null:
				move_false()
				return
			if tile_data.get_custom_data("walkable") == false:
				move_false()
				return
			if target_tile == GLOBAL.bomb_position:
				move_false()
				return
			
			var tween:Tween = create_tween()
			tween.tween_property(self, "position", tile_map.map_to_local(target_tile), valocidad)
			tween.tween_callback(move_false)
			print(current_tile)


func move_false():
	is_moving = false
