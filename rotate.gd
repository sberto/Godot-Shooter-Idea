extends Camera3D

@onready var initial_position = position;
var time = 0

func _physics_process(delta: float) -> void:
	time += delta
	position = initial_position + Vector3(sin(time), 0., 0.)
