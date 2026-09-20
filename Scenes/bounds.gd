extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var player = %Guy
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (player.global_position.x >= 2000):
		print("TOO FAR!!!")
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	pass
