extends Node2D

@onready var spawner: MultiplayerSpawner = $MultiplayerSpawner
@onready var level: Env = $Test

@export var tank_scene : PackedScene
@export var background_music: AudioStream

func _ready() -> void:
	Lobby.player_loaded.rpc()
	pass

#Called from lobby when all players are loaded
func start_game()-> void:
	SoundManager.play_sfx(background_music)
	_spawn_players()
	pass
	
func _spawn_players() -> void:
	for id: int in Lobby.players:
		var tank : Tank = tank_scene.instantiate() as Tank
		tank.name = str(id)
		add_child(tank, true);
		tank.position = level.map_to_local(level.get_spawn_point())
	pass
