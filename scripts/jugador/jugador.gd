extends CharacterBody2D

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		move(Vector2.UP)
	if Input.is_action_pressed("ui_down"):
		move(Vector2.DOWN)
	if Input.is_action_pressed("ui_left"):
		move(Vector2.LEFT)
	if Input.is_action_pressed("ui_right"):
		move(Vector2.RIGHT)

func move(direction: Vector2):
	print(direction)
	



