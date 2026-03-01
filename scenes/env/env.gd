@tool
class_name Env
extends TileMapLayer

@onready var fog_of_war: CanvasModulate  = $FogOfWar

@export var experimental_features: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if experimental_features:
		fog_of_war.show()
		return
	
	fog_of_war.hide()
