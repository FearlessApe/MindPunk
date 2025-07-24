extends CharacterBody2D

@export var speed: float = 200.0
@export var acceleration: float = 15.0

var current_velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var input_dir: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down");
	
	# Calculate target velocity
	var target_velocity: Vector2 = input_dir * speed
	
	# Smooth acceleration
	current_velocity = current_velocity.lerp(target_velocity, acceleration * delta)
	
	# Move player
	velocity = current_velocity
	move_and_slide()
	
