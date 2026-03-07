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
		
		turret.look_at(input_synchronizer.mouse_position)

		move_and_slide()
	pass


func _input(event: InputEvent) -> void:
	if multiplayer.get_unique_id() != name.to_int():
		return

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var coords := get_global_mouse_position()
		shoot.rpc(coords)


@rpc("any_peer", "call_local", "reliable")
func shoot(coords: Vector2):
	if !multiplayer.is_server():
		return
	
	var shell := shell_scene.instantiate()
	shell.global_position = shell_spawn.global_position
	shell.rotation = turret.rotation
	shell.scale = scale
	shell.set_destination(coords)
	$/root/Game.add_child(shell, true)


func get_shot(_bullet: Node2D):
	print("you've been hit")
	queue_free()
