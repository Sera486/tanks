class_name Tank
extends CharacterBody2D

@onready var turret = $TurretSprite2D2
@onready var shell_spawn = $TurretSprite2D2/Marker2D
@onready var input_synchronizer : MultiplayerSynchronizer = $InputSynchronizer

@export var shell_scene: PackedScene 

const SPEED: float = 200.0
const ROTATION_SPEED: float = 5.0

func _enter_tree() -> void:
	$InputSynchronizer.set_multiplayer_authority(name.to_int())
	

func _physics_process(delta: float) -> void:
	if multiplayer.is_server():
		rotation += input_synchronizer.rotation_direction * delta * ROTATION_SPEED	
		velocity = transform.y * input_synchronizer.movement_direction * SPEED * -1

		turret.look_at(get_global_mouse_position())

		move_and_slide()
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var coords := get_global_mouse_position()
		shoot(coords)
	
func shoot(coords: Vector2):
	var shell := shell_scene.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
	shell.global_position = shell_spawn.global_position
	shell.rotation = turret.rotation
	shell.scale = scale
	shell.set_destination(coords)
	get_tree().root.add_child(shell)

func get_shot(bullet: Node2D):
	print("you've been hit")
	queue_free()
