# MusicManager.gd
extends Node

static var playTheme = true;

func play_music(stream: AudioStream):
	# Check if the same music is already playing to avoid restarting it
	print(playTheme);
	if (!playTheme):
		print("STOP")
		return
	
	
	$TheSong.play()
	
func stop_music():
	$TheSong.stop()
