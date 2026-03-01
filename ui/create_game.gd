extends Control

@onready var connection_log : RichTextLabel = $VBoxContainer/ConnectionLog

func _ready() -> void:
	Lobby.create_game()
	Lobby.player_connected.connect(_on_player_connected)
	pass

func _on_player_connected(player_id: int, player_info) -> void:
	connection_log.append_text("Player Id: %s, name %s connected" % [player_id, player_info.name]);
	pass
