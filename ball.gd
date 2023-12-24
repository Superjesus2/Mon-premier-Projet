extends Node2D

var angle: float = 0
var speed: float = 40

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2.UP.rotated(angle) * delta * speed
