extends Node2D

var angle: float = 0
var speed: float = 40
var hue: float = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2.UP.rotated(angle) * delta * speed
	$ColorRect.color = Color.from_hsv(hue,1,1)
