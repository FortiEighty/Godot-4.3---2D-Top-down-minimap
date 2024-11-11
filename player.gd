extends CharacterBody2D

# Declaring speed variables and acceleration
# With #export those settings are easily configurable through inspector
@export var acceleration : float = 300.0
@export var maximum_speed : float = 300.0

var input := Vector2.ZERO

func _physics_process(delta: float) -> void:
	# Using default UI inputs from Godot to detect button press and get the direction of the movement
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# Normalizing input to get clear direction
	input = input.normalized()
	
	# Calculating velocity to move the player object
	velocity.x = move_toward(velocity.x, maximum_speed * input.x, acceleration * delta)
	velocity.y = move_toward(velocity.y, maximum_speed * input.y, acceleration * delta)
	
	# Moving the player object
	move_and_slide()
