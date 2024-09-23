@tool
extends Node3D

func _physics_process(delta: float) -> void:
	global_position = %Camera.global_position
	rotation = %Camera.rotation
	#transform = %Camera.transform
