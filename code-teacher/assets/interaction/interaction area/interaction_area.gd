extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"


func _ready():
	z_index = 9999


var interact : Callable = func():
	pass


func _on_body_entered(body):
	INTERACTIONMANAGER.register_area(self)


func _on_body_exited(body):
	INTERACTIONMANAGER.unregister_area(self)
