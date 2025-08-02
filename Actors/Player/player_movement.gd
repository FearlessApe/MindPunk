extends CharacterBody2D

@export var speed: float = 20.0
@export var acceleration: float = 15.0

var current_velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var input_dir: Vector2 = Input.get_vector("ui_left","ui_right","ui_up", "ui_down");
	
	var target_velocity: Vector2 = input_dir * speed
	
	#Smoothing the speed. By using current Velocity/
	current_velocity = current_velocity.lerp(target_velocity, acceleration * delta)
	
	
	# Use velocity as current
	velocity = current_velocity
	
	# call move and slide
	move_and_slide()
