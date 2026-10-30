extends Node2D

var can_exit = false

func _ready() -> void:
	$CanvasLayer/Ripple_transition/AnimatedSprite2D.play("fade_out")
	$CanvasLayer/Tracker_Stage1/HBoxContainer/SrSuave.modulate.a = 0.25
	await $CanvasLayer/Ripple_transition/AnimatedSprite2D.animation_finished
	$CanvasLayer/Ripple_transition.hide()

func _process(delta: float) -> void:
	pass

func _on_sr_suave_body_entered(body: Node2D) -> void:
	print("body entered signal")
	$CanvasLayer/Tracker_Stage1/HBoxContainer/SrSuave.modulate.a = 1
	$CanvasLayer/Label.text = "Task: 
		Go to the Exit."
	can_exit = true

func _on_exit_body_entered(body: Node2D) -> void:
	if can_exit == true:
		$CanvasLayer/Ripple_transition/AnimatedSprite2D.play("fade_in")
		await $CanvasLayer/Ripple_transition/AnimatedSprite2D.animation_finished
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	else: 
		$CanvasLayer/Label.text = "Task: 
			Find Sr. Suave before you can exit."
