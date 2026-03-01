extends CharacterBody2D


const SPEED = 300.0
const ROTATION_SPEED = 10.0

func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func _physics_process(delta: float) -> void:
	var movement_direction := Input.get_axis("move_backward", "move_forward")
	var rotation_direction := Input.get_axis("rotate_left", "rotate_right")

	rotation += rotation_direction * delta * ROTATION_SPEED	
	velocity = transform.y * movement_direction * SPEED * -1

	move_and_slide()
