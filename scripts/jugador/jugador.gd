extends CharacterBody2D

const SPEED = 300.0


func _physics_process(delta):
	motion_control()

func motion_control() -> void:
	velocity.x = GLOBAL.get_axis().x * SPEED
	velocity.y = GLOBAL.get_axis().y * - SPEED
	move_and_slide()


