extends Panel

var time: float = 0.0
@export var timer_stopped: bool = false

func _process(delta: float) -> void:
	if timer_stopped:
		return

	time += delta

	var total_msec: int = int(fmod(time, 1.0) * 100)
	var total_sec: int = int(fmod(time, 60.0))
	var total_min: int = int(time / 60.0)

	if has_node("minutes"):
		$minutes.text = "%02d:" % total_min
	if has_node("seconds"):
		$seconds.text = "%02d." % total_sec
	if has_node("mseconds"):
		$mseconds.text = "%02d" % total_msec
