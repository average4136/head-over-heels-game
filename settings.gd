extends Control


func _on_volume_value_changed(value: float) -> void:
 AudioServer.set_bus_volume_db(50,value)


func _on_back_button_pressed() -> void:	
 get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
