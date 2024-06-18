extends CharacterBody2D

#sistema clasico
'''const SPEED = 300.0

func _physics_process(delta):
	motion_control()

func motion_control() -> void:
	velocity.x = GLOBAL.get_axis().x * SPEED
	velocity.y = GLOBAL.get_axis().y * - SPEED
	move_and_slide()

'''

#sistema tosco movimiento por casilla (no interpreta las coliciones)
'''var curr_position = [0,0]

func _input(event):
	if event.is_action_pressed("ui_right"):
		curr_position[0] += 16
		get_node("Sprite2D").look_at(self.position + Vector2(1, 0))
	elif event.is_action_pressed("ui_left"):
		curr_position[0] -= 16
		get_node("Sprite2D").look_at(self.position + Vector2(-1, 0))
	elif event.is_action_pressed("ui_up"):
		curr_position[1] -= 16
		get_node("Sprite2D").look_at(self.position + Vector2(0, -1))
	elif event.is_action_pressed("ui_down"):
		curr_position[1] += 16
		get_node("Sprite2D").look_at(self.position + Vector2(0, 1))
	self.position = Vector2(curr_position[0], curr_position[1])
'''


