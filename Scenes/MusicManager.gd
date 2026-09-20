# MusicManager.gd
extends Node

static var playTheme = true;
static var playLevelSong = true;

func play_music(stream: AudioStream):
	# Check if the same music is already playing to avoid restarting it
	print(playTheme);
	if (!playTheme):
		print("STOP")
		return
	
	$TheSong.play()
	
func stop_music():
	$TheSong.stop()
	
	
func play_music_level(stream: AudioStream):
	# Check if the same music is already playing to avoid restarting it
	print(playLevelSong);
	if (!playLevelSong):
		print("STOP")
		return
	
	$LevelSong.play()
	
func stop_music_level():
	$LevelSong.stop()
