extends Area2D
@export var jump_force = 300
@onready var animation_sprite = $AnimatedSprite2D

func _on_body_entered(body):
	if body is Player: # if colliding with Player class
		body.velocity.y = -jump_force
