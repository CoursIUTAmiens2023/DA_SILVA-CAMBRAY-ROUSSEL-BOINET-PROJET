extends AnimatedSprite2D

var bulletExplode = preload("res://Scenes/Player/bulletExplode.tscn")

var speed : int = 600
var direction : int = -1
var damageBullet : int = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_local_y(direction * speed * delta)


func _on_timer_timeout():
	queue_free()


func _on_hitbox_area_entered(area):
	bulletIsExplode()


func _on_hitbox_body_entered(body):
	bulletIsExplode()

func bulletIsExplode():
	var bulletExplodeInstance = bulletExplode.instantiate() as Node2D
	bulletExplodeInstance.global_position = global_position
	get_parent().add_child(bulletExplodeInstance)
	queue_free()

func getDamageAmount() -> int:
	return damageBullet
