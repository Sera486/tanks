extends CharacterBody2D

@onready var turret = $TurretSprite2D2
@onready var shell_spawn = $TurretSprite2D2/Marker2D

@export var shell_scene: PackedScene 

const SPEED = 200.0
const ROTATION_SPEED = 10.0

func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func _physics_process(delta: float) -> void:
	var movement_direction := Input.get_axis("move_backward", "move_forward")
	var rotation_direction := Input.get_axis("rotate_left", "rotate_right")

	rotation += rotation_direction * delta * ROTATION_SPEED	
	velocity = transform.y * movement_direction * SPEED * -1
	
	turret.look_at(get_global_mouse_position())
	
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		shoot(get_global_mouse_position())
	
func shoot(coords: Vector2):
	var shell := shell_scene.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
	#shell.position = shell_spawn.position
	shell.set_destination(coords)
	shell_spawn.add_child(shell)

func get_shot(bullet: Node2D):
	#bullet.queue_free()
	print("you've been hit")
