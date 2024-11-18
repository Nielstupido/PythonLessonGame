extends Label


@onready var timer = $Timer


func _ready():
	self.hide()


func set_error_msg(msg : String):
	self.show()
	text = msg
	timer.stop()
	timer.start(3.0)


func _on_timer_timeout():
	self.hide()
