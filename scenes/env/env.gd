@tool
class_name Env
extends TileMapLayer

@onready var fog_of_war: CanvasModulate  = $FogOfWar
@export var tank_scene: PackedScene
@export var spawn_points: Array[Vector2i] = [Vector2i(4,4), Vector2i(4,33), Vector2i(33, 4), Vector2i(33,33)]

@export var experimental_features: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if experimental_features:
		fog_of_war.show()
		return
	
	fog_of_war.hide()


func get_spawn_point() -> Vector2i:
	return spawn_points.pop_front()
