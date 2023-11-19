extends Node2D

@onready var rect = $rectangle
var elapsedtime = 0.
var coucouprinted = false
var frame = 0
var which_color = 0
var colors = [Color.RED, Color.BLUE, Color.GREEN, Color.NAVAJO_WHITE, Color.BLUE_VIOLET]

func _ready():
	pass

func _process(delta):
	frame += 1
	var nbcolors = colors.size()
	var tint = colors [which_color % nbcolors]
	var should_i_tint = frame % 60
	if should_i_tint == 0:
		rect.modulate = tint
		which_color += 1
	
	
	
	
	
	
	
#	elapsedtime = elapsedtime+delta
#	if elapsedtime >= 1 and not coucouprinted:
#		print("coucou")
#		coucouprinted = true
#		$rectangle.modulate = Color.from_hsv (randf(),1,1)
