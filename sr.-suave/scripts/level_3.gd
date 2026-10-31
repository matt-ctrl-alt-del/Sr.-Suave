extends Node2D

var can_exit = false
var is_restarting = false

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
		Beware of the intruders!
		Guide Sr. Suave to the Exit"
	can_exit = true
	
func _on_killzone_body_entered(body: Node2D) -> void:
	if is_restarting:
		return
	is_restarting = true
	$CanvasLayer/Ripple_transition.show()
	$CanvasLayer/Ripple_transition/AnimatedSprite2D.play("fade_in")
	await $CanvasLayer/Ripple_transition/AnimatedSprite2D.animation_finished
	get_tree().reload_current_scene()

func _on_exit_body_entered(body: Node2D) -> void:
	if can_exit == true:
		$enemy.queue_free()
		$enemy2.queue_free()
		$CanvasLayer/Ripple_transition.show()
		$CanvasLayer/Ripple_transition/AnimatedSprite2D.play("fade_in")
		await $CanvasLayer/Ripple_transition/AnimatedSprite2D.animation_finished
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	else:
		$CanvasLayer/Label.text = "Task:
You have to find Sr. Suave and then go to the exit!"
