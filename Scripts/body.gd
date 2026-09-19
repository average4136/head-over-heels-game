extends RigidBody2D

@export var max_speed: float = 900.0
@export var move_force: float = 15000.0
@export var jump_force: float = 1200.0

func _physics_process(_delta: float) -> void:
	var input_direction := Input.get_axis(
		"move_left",
		"move_right"
	)

	# Horizontal movement
	if input_direction != 0.0:
		sleeping = false

		var movement_force := Vector2(
			input_direction * move_force,
			0.0
		)

		apply_central_force(movement_force)
		
		if abs(linear_velocity.x) > max_speed:
			linear_velocity.x = sign(linear_velocity.x) * max_speed

	# Small controlled jump
	if Input.is_action_just_pressed("jump"):
		if $GroundRay.is_colliding():
			apply_central_impulse(
				Vector2(0.0, -jump_force)
			)
