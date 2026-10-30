extends CharacterBody2D

const SPEED = 160.0

func _physics_process(delta: float) -> void:
	var input_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * SPEED
	if input_direction.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif input_direction.x < 0: 
		$AnimatedSprite2D.flip_h = true

	move_and_slide()
