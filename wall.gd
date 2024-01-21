extends Node2D

var wall_y_position = randf_range(200,520)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = Vector2(1480,wall_y_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.x -= 4
