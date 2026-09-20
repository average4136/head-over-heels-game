extends Area2D

@export var launch_force: float = 1000.0


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Body":
		body.apply_central_impulse(
			Vector2(0.0, -launch_force)
		)
