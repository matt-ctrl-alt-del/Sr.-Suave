extends Node2D


func _ready() -> void:
	$CanvasLayer/Ripple_transition/AnimatedSprite2D.play("fade_out")
	await $CanvasLayer/Ripple_transition/AnimatedSprite2D.animation_finished
	$CanvasLayer/Ripple_transition.hide()


func _process(delta: float) -> void:
	pass
