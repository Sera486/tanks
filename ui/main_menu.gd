extends Control

var create_game_scene = preload("res://ui/create_game.tscn")
var join_game_scene = preload("res://ui/join_game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_create_game_button_pressed() -> void:
	get_tree().change_scene_to_packed(create_game_scene)


func _on_join_game_button_pressed() -> void:
	get_tree().change_scene_to_packed(join_game_scene)
