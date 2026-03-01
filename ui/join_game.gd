extends Control

@onready var server_ip: TextEdit = $VBoxContainer/ServerHBoxContainer/ServerTextEdit
@onready var player_name: TextEdit = $VBoxContainer/NameHBoxContainer/NameTextEdit
@onready var join_button: Button = $VBoxContainer/JoinButton

func _ready() -> void:
	join_button.connect("button_down", _on_join_button_down)
	pass
	
func _on_join_button_down()->void:
	var address := server_ip.text
	Lobby.player_info.name = player_name.text;
	Lobby.join_game(server_ip.text)
	pass
