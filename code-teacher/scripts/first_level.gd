extends Node2D
@export var WinTarget: Draggable
@export var NextLevel: PackedScene
@onready var door_sprite1 = $DoorBody/Door
@onready var door_sprite2 = $DoorBody2/Door
@onready var player = $Player
@onready var hud = $HUD
@export var level_name: String = ""
@onready var first_cmd = $"Droppable Area5"
@onready var second_cmd = $"Droppable Area2"
@onready var third_cmd = $"Droppable Area4"

func _ready():
	hud.resume()
	if level_name == "level3":
		player.girl_sprite.visible = false
		player.boy_sprite.visible = true
	else:
		player.boy_sprite.visible = false
		player.girl_sprite.visible = true

func _process(delta):
	if WinTarget != null && WinTarget.is_inside_droppable == true && GLOBAL.is_dragging == false:
		get_tree().change_scene_to_packed(NextLevel)
	if first_cmd.is_right_answer == true and second_cmd.is_right_answer == true and third_cmd.is_right_answer == true:
		player.active = true


func _on_area_2d_body_entered(body: Node2D):
	if body is Player:
		if first_cmd.is_right_answer == false and second_cmd.is_right_answer == false and third_cmd.is_right_answer == false:
			body.velocity = Vector2.ZERO
			body.active = false
