extends CharacterBody2D
@onready var minion_sprite = $minionSprite


@export var health = 50 
var speed = 100
var score = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y += speed * delta
	minion_sprite.play("default")
	die()

func _on_hurt_box_area_entered(area):
	if(area.get_parent().has_method("getDamageAmount")):
		var node = area.get_parent() as Node
		health -= node.damageBullet
	if(area.get_parent().has_method("getWaveDamage")):
		var node = area.get_parent() as Node
		health -= node.damageWave
	if(area.get_parent().has_method("isPlayer")):
		queue_free()

func die():
	if(health <=0):
		queue_free()
