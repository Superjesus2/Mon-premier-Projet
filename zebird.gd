extends Node2D

var move_the_bird = false

func _ready():
	pass
	
func _process(_delta):
	position.y += 2
	if move_the_bird:
		position.y -= 50
	move_the_bird = false

func _input(_event):
	if _event is InputEventKey and _event.physical_keycode == KEY_SPACE:
		if _event.pressed and not _event.is_echo():
			move_the_bird = true
