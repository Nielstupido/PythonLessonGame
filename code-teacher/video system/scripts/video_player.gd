extends VideoStreamPlayer
@export var video_to_be_played: VideoStreamTheora # ogv format
@onready var interaction_area: InteractionArea = $InteractionArea

# Called when the node enters the scene tree for the first time.
func _ready():
	stream = video_to_be_played
	interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
	if !is_playing():
		play()
	elif is_playing():
		paused = true

func _on_finished():
	queue_free()
