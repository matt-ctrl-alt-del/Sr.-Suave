extends Control

func _ready() -> void:
	$CanvasLayer/Ripple_transition/AnimatedSprite2D.play("fade_out")
	await $CanvasLayer/Ripple_transition/AnimatedSprite2D.animation_finished
	$CanvasLayer/Ripple_transition.hide()

func _process(delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	$CanvasLayer/Ripple_transition.show()
	$CanvasLayer/Ripple_transition/AnimatedSprite2D.play("fade_in")
	await $CanvasLayer/Ripple_transition/AnimatedSprite2D.animation_finished
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")

func _on_quit_pressed() -> void:
	$CanvasLayer/Ripple_transition.show()
	$CanvasLayer/Ripple_transition/AnimatedSprite2D.play("fade_in")
	await $CanvasLayer/Ripple_transition/AnimatedSprite2D.animation_finished
	get_tree().quit()
