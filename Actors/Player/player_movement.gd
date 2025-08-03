extends CharacterBody2D

@export var max_speed: float = 200.0
# Giveing the player smoother for aceleration.
const acceleration_smoothing = 20.0

func _process(_delta):
	# movement vector
	var movement_vector = get_movement_vector()
	
	# input direrction
	var direction = movement_vector.normalized()
	
	var target_velocity = direction * max_speed
	
	# Use velocity as current
	velocity = velocity.lerp(target_velocity, 1 - exp(-_delta * acceleration_smoothing))
	
	# call move and slide
	move_and_slide()
	
	print(direction)


func get_movement_vector():
	var x_movement = Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left")
	var y_movement = Input.get_action_strength("Move_Down") - Input.get_action_strength("Move_Up")
	return Vector2(x_movement,y_movement)
	
