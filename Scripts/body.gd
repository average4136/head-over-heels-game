extends RigidBody2D


# How strongly the player pushes the body horizontally.
#
# This is FORCE, not speed.
# Bigger number = faster acceleration.
@export var move_force: float = 10000.0


func _physics_process(_delta: float) -> void:

	# Returns:
	# -1.0 when moving left
	#  0.0 when doing nothing
	# +1.0 when moving right
	var input_direction := Input.get_axis(
		"move_left",
		"move_right"
	)


	# Only do something if the player is pressing a direction.
	if input_direction != 0.0:

		# Wake the physics body if Godot allowed it to sleep.
		sleeping = false


		# Create a horizontal force.
		#
		# Pressing RIGHT:
		# Vector2(5000, 0)
		#
		#              ------>
		#
		# Pressing LEFT:
		# Vector2(-5000, 0)
		#
		#        <------
		var movement_force := Vector2(
			input_direction * move_force,
			0.0
		)


		# Ask the physics engine to push the body.
		apply_central_force(movement_force)
