extends Area2D

var affected_bodies: Array[RigidBody2D] = []


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		if body.name == "Body" or body.name == "Head":
			if body not in affected_bodies:
				affected_bodies.append(body)
				body.gravity_scale *= 0.333333333


func _on_body_exited(body: Node2D) -> void:
	if body is RigidBody2D:
		if body in affected_bodies:
			affected_bodies.erase(body)
			body.gravity_scale *= 3.0
