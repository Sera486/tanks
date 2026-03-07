extends Area2D

const SPEED = 300.0

@onready var timer := $Timer
@onready var collision_shape = $CollisionShape2D

var direction := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_shape.disabled = true
	timer.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += direction * delta * SPEED

func set_destination(coords: Vector2):
	direction = global_position.direction_to(coords)
	rotation = position.angle_to_point(coords)


func _on_body_entered(body: Node2D) -> void:
	if !multiplayer.is_server():
		return
	
	if body.has_method("get_shot"):
		body.get_shot(self)
	queue_free()

func _on_timer_timeout() -> void:
	collision_shape.disabled = false
