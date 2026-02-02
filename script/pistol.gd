extends Node3D

@onready var animation: AnimatedSprite2D = $CanvasLayer/Control/AnimatedSprite2D
@onready var shoot_sound: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	animation.play("idle")

func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			shoot()

func shoot() -> void:
	animation.play("shoot")
	shoot_sound.play()
	await animation.animation_finished
	animation.play("idle")
