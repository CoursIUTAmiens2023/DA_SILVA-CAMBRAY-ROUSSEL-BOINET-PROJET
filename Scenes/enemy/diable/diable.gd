extends CharacterBody2D
@onready var diable_sprite = $diableSprite


@export var health = 25
var speed = 200
var score = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y += speed * delta
	diable_sprite.play("default")
	die()
	



func _on_hurtbox_area_entered(area):
	if(area.get_parent().has_method("getDamageAmount")):
		var node = area.get_parent() as Node
		health -= node.damageBullet
	if(area.get_parent().has_method("getWaveDamage")):
		var node = area.get_parent() as Node
		health -= node.damageWave
	if(area.get_parent().has_method("isPlayer")):
		queue_free()

func die():
	if(health <= 0):
		queue_free()
