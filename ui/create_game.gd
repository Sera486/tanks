extends Control

@onready var connection_log : RichTextLabel = $VBoxContainer/ConnectionLog
@onready var start_button : Button = $VBoxContainer/StartButton
var game_scene_path: String = 'res://scenes/game/game.tscn';

func _ready() -> void:
	start_button.connect("button_down", _on_start_button_down)
	
	Lobby.create_game()
	Lobby.player_connected.connect(_on_player_connected)
	
	pass

func _on_player_connected(player_id: int, player_info) -> void:
	connection_log.append_text("Player Id: %s, name %s connected" % [player_id, player_info.name]);
	pass
	
	
func _on_start_button_down() -> void:
	Lobby.load_game.rpc(game_scene_path)
	pass
