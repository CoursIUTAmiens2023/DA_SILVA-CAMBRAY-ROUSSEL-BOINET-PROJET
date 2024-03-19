extends Node2D

var enemy = preload("res://Scenes/enemy/diable/diable.tscn")
var enemy_list = [
	preload("res://Scenes/enemy/diable/diable.tscn"),
	preload("res://Scenes/enemy/minion/minion.tscn"),
	preload("res://Scenes/enemy/phantom/phantom.tscn")
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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
