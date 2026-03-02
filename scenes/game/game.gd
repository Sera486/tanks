extends Node2D

@export var tank_scene : PackedScene
@onready var spawner: MultiplayerSpawner = $MultiplayerSpawner
@onready var level: Env = $Test

func _ready() -> void:
	spawner.add_spawnable_scene("res://scenes/tank/tank.tscn")
	push_warning('loaded')
	Lobby.player_loaded.rpc()
	pass

#Called from lobby when all players are loaded
func start_game()-> void:
	_spawn_players()
	pass
	
func _spawn_players() -> void:
	push_warning('spawn_players')
	for id: int in Lobby.players:
		var tank : Tank = tank_scene.instantiate() as Tank
		tank.name = str(id)
		spawner.add_child(tank, true);
		tank.position = level.map_to_local(level.get_spawn_point())
	pass
