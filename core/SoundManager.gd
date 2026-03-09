extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func play_sfx(stream: AudioStream) -> void:
	var asp = AudioStreamPlayer.new()
	add_child(asp)
	
	asp.stream = stream
	asp.play()
	
	asp.finished.connect(asp.queue_free)
