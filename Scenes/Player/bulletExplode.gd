extends AnimatedSprite2D
@onready var bullet_explode = $"."

func _process(delta):
	bullet_explode.play("default")
	
func _on_timer_timeout():
	queue_free()
