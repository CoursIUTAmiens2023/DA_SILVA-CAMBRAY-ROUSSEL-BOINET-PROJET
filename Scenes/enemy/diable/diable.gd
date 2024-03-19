extends AnimatedSprite2D
@onready var diable = $"."


var speed = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y += speed * delta
	diable.play("default")
