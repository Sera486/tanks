extends Area2D

const SPEED = 700.0

var destination := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction := position.direction_to(destination)
	position += direction * delta * SPEED
	rotation = destination.angle_to_point(position)

func set_destination(coords: Vector2):
	destination = coords

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("get_shot"):
		body.get_shot(self)
