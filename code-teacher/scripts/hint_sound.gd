extends Sprite2D
@export var sound_to_play : AudioStreamMP3
@onready var streamer = $AudioStreamPlayer
@onready var interaction_area = $InteractionArea


func _ready():
	streamer.stream = sound_to_play
	interaction_area.interact = Callable(self, "_on_interact")
	

func _on_interact():
	streamer.play()
