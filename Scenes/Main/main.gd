extends Node2D

var enemy_list = [
	preload("res://Scenes/enemy/diable/diable.tscn"),
	preload("res://Scenes/enemy/minion/minion.tscn"),
	preload("res://Scenes/enemy/phantom/phantom.tscn")
]

var ecranJeuScript
var ecranJeuNode

@onready var score_player = $"../CanvasLayer/ScoreAndLife/ScorePlayer"
@onready var life_1 = $"../CanvasLayer/ScoreAndLife/GridContainer/Life1"
@onready var life_2 = $"../CanvasLayer/ScoreAndLife/GridContainer/Life2"
@onready var life_3 = $"../CanvasLayer/ScoreAndLife/GridContainer/Life3"

var score : String

# Called when the node enters the scene tree for the first time.
func _ready():
	ecranJeuScript = load("res://Scenes/EcranJeu/ScriptEcranJeu.cs")
	ecranJeuNode = ecranJeuScript.new()

func _on_spawn_timer_timeout():
	#var enemy_instance = enemy.instantiate()
	#add_child(enemy_instance)
	#enemy_instance.position = $SpawnPosition.position
	
	var enemy_spawn = randi_range(0,enemy_list.size()-1)
	var scene = enemy_list[enemy_spawn].instantiate()
	scene.position = $SpawnPosition.position
	add_child(scene)
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes [randi() % nodes.size()]
	var position = node.position
	$SpawnPosition.position = position

func _process(delta):
	score = ecranJeuNode.getScore()
	score_player.text = score
	showHideHealth()

func _on_child_exiting_tree(node):
	if(node.has_method("dieDiable")):
		ecranJeuNode.GainPoint(5)
	if (node.has_method("dieMinion")):
		ecranJeuNode.GainPoint(10)
	if (node.has_method("diePhantom")):
		ecranJeuNode.GainPoint(20)

func showHideHealth():
	var node = get_node("Player")
	if(node != null and node.has_method("getHealth")):
		var healthLeft = node.getHealth()
		if(healthLeft == 2):
			life_3.hide()
		elif(healthLeft == 1):
			life_2.hide()
	else:
		life_1.hide()
		var gameOverPath = "res://Scenes/GameOverMenu/game_over.tscn"
		get_tree().change_scene_to_file(gameOverPath)
		
