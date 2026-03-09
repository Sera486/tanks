extends Node2D

@export var tank_scene : PackedScene
@onready var spawner: MultiplayerSpawner = $MultiplayerSpawner
@onready var level: Env = $Test

@onready var bg_music: AudioStreamPlayer = $BgMusic

func _ready() -> void:
	Lobby.player_loaded.rpc()
	pass

#Called from lobby when all players are loaded
func start_game()-> void:
	bg_music.play()
	_spawn_players()
	pass
	
func _spawn_players() -> void:
	for id: int in Lobby.players:
		var tank : Tank = tank_scene.instantiate() as Tank
		tank.name = str(id)
		add_child(tank, true);
		tank.position = level.map_to_local(level.get_spawn_point())
	pass
