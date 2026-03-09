extends Control

@onready var server_ip: TextEdit = $VBoxContainer/ServerHBoxContainer/ServerTextEdit
@onready var player_name: TextEdit = $VBoxContainer/NameHBoxContainer/NameTextEdit

func _ready() -> void:
	pass


func _on_join_button_pressed() -> void:
	Lobby.player_info.name = player_name.text;
	Lobby.join_game(server_ip.text)
	pass
