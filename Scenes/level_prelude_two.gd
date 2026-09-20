extends Node2D

@export var menu_music: AudioStream 

# Called when the node enters the scene tree for the first time.
func _ready():
	MenuTheme.play_music_level(menu_music) # check if we need to play it
	MenuTheme.playLevelSong = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
