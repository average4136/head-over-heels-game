extends CanvasLayer

signal line_finished(speaker: String, text: String)
signal all_dialogue_finished

var voice_player: AudioStreamPlayer
var subtitle_label: RichTextLabel

var line_queue: Array[Dictionary] = []
var is_playing: bool = false

func _ready() -> void:
	layer = 100 # Draws on top of everything
	
	voice_player = AudioStreamPlayer.new()
	
	# Verify that the "Voice" bus actually exists before setting it
	if AudioServer.get_bus_index("Voice") != -1:
		voice_player.bus = "Voice"
	else:
		push_warning("DialogueManager: Bus 'Voice' not found in Audio tab! Falling back to Master.")
		voice_player.bus = "Master"
		
	add_child(voice_player)

	# Setup subtitle label
	subtitle_label = RichTextLabel.new()
	subtitle_label.bbcode_enabled = true
	subtitle_label.fit_content = true
	subtitle_label.scroll_active = false
	subtitle_label.autowrap_mode = TextServer.AUTOWRAP_WORD
	
	# Anchor to the bottom center of the viewport
	subtitle_label.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	subtitle_label.offset_left = 120.0
	subtitle_label.offset_right = -120.0
	subtitle_label.offset_bottom = -45.0
	subtitle_label.offset_top = -120.0
	
	# Text styling: Clean outline and drop shadow for maximum background contrast
	subtitle_label.add_theme_constant_override("outline_size", 6)
	subtitle_label.add_theme_color_override("font_outline_color", Color(0, 0, 0, 1.0))
	subtitle_label.add_theme_constant_override("shadow_offset_x", 2)
	subtitle_label.add_theme_constant_override("shadow_offset_y", 2)
	subtitle_label.add_theme_color_override("font_shadow_color", Color(0, 0, 0, 0.8))
	
	subtitle_label.visible = false
	add_child(subtitle_label)
	
	

func queue_line(speaker: String, text: String, audio: AudioStream = null, duration: float = 0.0) -> void:
	line_queue.append({
		"speaker": speaker,
		"text": text,
		"audio": audio,
		"duration": duration
	})
	if not is_playing:
		_play_next()

func _play_next() -> void:
	if line_queue.is_empty():
		is_playing = false
		subtitle_label.visible = false
		all_dialogue_finished.emit()
		return

	is_playing = true
	var current = line_queue.pop_front()
	
	# Speaker prefix colors
	var speaker_tag: String = ""
	if current["speaker"] == "boy":
		speaker_tag = "[color=#38bdf8]Boy:[/color] " # Soft electric blue
	elif current["speaker"] == "narrator":
		speaker_tag = "[color=#4ade80]???:[/color] " # Light vibrant green
	elif current["speaker"] == "girl":
		speaker_tag = "[color=#f472b6]Girl:[/color] " # Soft pink

	# Center aligned, colored speaker, crisp white dialogue text
	subtitle_label.text = "[center]" + speaker_tag + "[color=#ffffff]" + current["text"] + "[/color][/center]"
	subtitle_label.visible = true

	var wait_time: float = current["duration"]
	if current["audio"] != null:
		print("DEBUG [DialogueManager]: Playing audio -> ", current["audio"].resource_path, " on bus -> ", voice_player.bus)
		voice_player.stream = current["audio"]
		voice_player.play()
		wait_time = max(current["audio"].get_length(), wait_time)
	else:
		print("DEBUG [DialogueManager]: No audio passed for line: '", current["text"], "'")
		if wait_time <= 0.0:
			wait_time = 2.0

	await get_tree().create_timer(wait_time).timeout
	line_finished.emit(current["speaker"], current["text"])
	_play_next()

func stop_dialogue() -> void:
	voice_player.stop()
	line_queue.clear()
	is_playing = false
	subtitle_label.visible = false
