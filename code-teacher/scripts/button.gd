extends Sprite2D

@onready var interaction_area = $InteractionArea
@export var panel_text: Label
@onready var box = preload("res://scenes/box.tscn")
@export var new_text : String 
@export var link: LinkButton

func _ready():
	#making a new callable, needs 2 arguments object that holds function and name
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	if new_text != null:
		panel_text.text = new_text
		if link != null:
			link.queue_free()
	else:
		var box_inst = box.instantiate()
		$Node2D.add_child(box_inst)
		$Node2D.add_child(box_inst)
		$Node2D.add_child(box_inst)
		$Node2D.add_child(box_inst)
		$Node2D.add_child(box_inst)
