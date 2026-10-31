extends Node2D

func _ready() -> void:
	$CanvasLayer/Tracker_stage3/HBoxContainer/sr_suave.modulate.a = 0.25
	$CanvasLayer/Ripple_transition/AnimatedSprite2D.play("fade_out")
	await $CanvasLayer/Ripple_transition/AnimatedSprite2D.animation_finished
	$CanvasLayer/Ripple_transition.hide()
	$Sr_Suave/PointLight2D.hide()

func _process(delta: float) -> void:
	pass

func _on_sr_suave_body_entered(body: Node2D) -> void:
	$Sr_Suave/PointLight2D.show()
	$CanvasLayer/Tracker_stage3/HBoxContainer/sr_suave.modulate.a = 1.0
	$CanvasLayer/Label.text = "Task:
			Guide Sr. Suave to the Exit"
	
