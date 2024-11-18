extends CharacterBody2D
class_name Player
@onready var girl_sprite = $girl
@onready var boy_sprite = $boy
@onready var female_sprite = $female
@onready var male_sprite = $male
@onready var camera = $Camera2D
@export var speed = 400
@onready var jump_sound = $Jump
var active = true
const JUMP_VELOCITY = -600.0


func _physics_process(delta):
	if active == true:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			jump_sound.play()
			velocity.y = JUMP_VELOCITY
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)

		if direction != 0:
			boy_sprite.flip_h = (direction == -1) # when direction is -1 (move_left) turn horizontaly
			girl_sprite.flip_h = (direction == -1)
			female_sprite.flip_h = (direction == -1)
			male_sprite.flip_h = (direction == -1)

		move_and_slide()
	update_animations()


func update_animations():
	if is_on_floor():
		if velocity.x == 0:
			girl_sprite.play("idle")
			boy_sprite.play("idle")
			female_sprite.play("idle")
			male_sprite.play("idle")
		else:
			boy_sprite.play("run")
			girl_sprite.play("run")
			female_sprite.play("run")
			male_sprite.play("run")
	else:
		if velocity.y < 0:
			boy_sprite.play("jump")
			girl_sprite.play("jump")
			female_sprite.play("jump")
			male_sprite.play("jump")
		else:
			boy_sprite.play("fall")
			girl_sprite.play("fall")
			female_sprite.play("fall")
			male_sprite.play("fall")