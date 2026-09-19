extends RigidBody2D

@export var move_force := 1400.0
@export var max_speed := 450.0
@export var braking_force := 500.0

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_axis("move_left","move_right")
	
	if input_dir !=0:
		apply_central_force(Vector2(input_dir*move_force,0))
	else:
		apply_central_force(Vector2(-linear_velocity.x * braking_force, 0))
