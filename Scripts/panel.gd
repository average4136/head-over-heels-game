extends Panel

var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var mseconds: int = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	time += delta
	mseconds = fmod(time,1) * 100
	seconds = fmod(time,60)
	minutes = fmod(time,3600) / 60
	$mseconds.text = "%02d:" % mseconds
	$seconds.text = "%02d:" % seconds
	$minutes.text = "%02d:" % minutes
	
		
	
		
	
	


func _pressed() -> void:
	pass # Replace with function body.
