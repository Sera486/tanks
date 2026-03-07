extends MultiplayerSynchronizer

@export var movement_direction: float
@export var rotation_direction: float
@export var mouse_position: Vector2i


func _ready() -> void:
	if get_multiplayer_authority() != multiplayer.get_unique_id():
		set_physics_process(false);
	pass


func _physics_process(_delta: float) -> void:
	movement_direction = Input.get_axis("move_backward", "move_forward")
	rotation_direction = Input.get_axis("rotate_left", "rotate_right")
	mouse_position = get_parent().get_global_mouse_position()
	pass
