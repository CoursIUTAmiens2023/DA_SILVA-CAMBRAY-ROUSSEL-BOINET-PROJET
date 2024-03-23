extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_replay_pressed():
	var gameScenePath = "res://Scenes/EcranJeu/ecran_jeu.tscn"
	get_tree().change_scene_to_file(gameScenePath)

func _on_return_pressed():
	var titleMenuPath = "res://Scenes/TitleMenu/title_menu.tscn"
	get_tree().change_scene_to_file(titleMenuPath)
