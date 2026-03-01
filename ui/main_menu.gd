extends Control

@onready var create_game_button = $VBoxContainer/CreateGameButton
@onready var join_game_button = $VBoxContainer/JoinGameButton

var create_game_scene = preload("res://ui/create_game.tscn")
var join_game_scene = preload("res://ui/join_game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_game_button.connect("button_down", _on_create_game_click)
	join_game_button.connect("button_down", _on_join_game_click)
	pass # Replace with function body.


func _on_create_game_click():
	get_tree().change_scene_to_packed(create_game_scene)
	pass


func _on_join_game_click():
	get_tree().change_scene_to_packed(join_game_scene)
	pass
