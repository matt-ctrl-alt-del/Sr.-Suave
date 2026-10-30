extends Node2D

var items_collected = 0

func _ready() -> void:
	$CanvasLayer/Ripple_transition/AnimatedSprite2D.play("fade_out")
	$CanvasLayer/Tracker_stage2/HBoxContainer/box.modulate.a = 0.25
	$CanvasLayer/Tracker_stage2/HBoxContainer/cone.modulate.a = 0.25
	$CanvasLayer/Tracker_stage2/HBoxContainer/cube.modulate.a = 0.25
	$CanvasLayer/Tracker_stage2/HBoxContainer/diamond.modulate.a = 0.25
	await $CanvasLayer/Ripple_transition/AnimatedSprite2D.animation_finished
	$CanvasLayer/Ripple_transition.hide()

func _process(delta: float) -> void:
	pass

func _on_box_body_entered(body: Node2D) -> void:
	$Node/box.queue_free()
	$CanvasLayer/Tracker_stage2/HBoxContainer/box.modulate.a = 1.0
	print("+1; box")
	items_collected += 1
	$CanvasLayer/Label.text = "Items Collected: " + (str(items_collected))

func _on_cone_body_entered(body: Node2D) -> void:
	$Node/cone.queue_free()
	$CanvasLayer/Tracker_stage2/HBoxContainer/cone.modulate.a = 1.0
	print("+1; cone")
	items_collected += 1
	$CanvasLayer/Label.text = "Items Collected: " + (str(items_collected))

func _on_cube_body_entered(body: Node2D) -> void:
	$Node/cube.queue_free()
	$CanvasLayer/Tracker_stage2/HBoxContainer/cube.modulate.a = 1.0
	print("+1; cube")
	items_collected += 1
	$CanvasLayer/Label.text = "Items Collected: " + (str(items_collected))

func _on_diamond_body_entered(body: Node2D) -> void:
	$Node/diamond.queue_free()
	$CanvasLayer/Tracker_stage2/HBoxContainer/diamond.modulate.a = 1.0
	print("+1; diamond")
	items_collected += 1
	$CanvasLayer/Label.text = "Items Collected: " + (str(items_collected))

func _on_exit_body_entered(body: Node2D) -> void:
	if items_collected == 4:
		$CanvasLayer/Ripple_transition.show()
		$CanvasLayer/Ripple_transition/AnimatedSprite2D.play("fade_out")
		get_tree().change_scene_to_file("res://scenes/thanks_screen.tscn")
	else:
		$CanvasLayer/Label.text = "You only have " + (str(items_collected)) + " items collected.
		Collect all four items to exit."
		
