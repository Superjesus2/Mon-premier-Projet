extends Node2D

@onready var rect = $rectangle
var elapsedtime = 0.
var coucouprinted = false
var frame = 0
var which_color = 0
var colors = [Color.RED, Color.BLUE, Color.GREEN, Color.NAVAJO_WHITE, Color.BLUE_VIOLET]

var SPEED = 300  #pixels par seconde
var speedx = 0
var speedy = 0

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
	
	speedy = 0
	speedy += -1 if Input.is_physical_key_pressed(KEY_W) else 0
	speedy += 1 if Input.is_physical_key_pressed(KEY_S) else 0
	speedx = 0
	speedx += -1 if Input.is_physical_key_pressed(KEY_A) else 0
	speedx += 1 if Input.is_physical_key_pressed(KEY_D) else 0
	
	var deplacement = Vector2(speedx, speedy)
	deplacement = deplacement.normalized()
	$rectangle.position += deplacement * delta * SPEED
#	$rectangle.position.x += speedx * delta
#	$rectangle.position.y += speedy * delta
	
func _input(ev):
	if ev is InputEventKey:
		if ev.physical_keycode == KEY_SPACE and ev.is_pressed() and not ev.is_echo():
			SPEED = 450 if SPEED == 300 else 300
	
#	elapsedtime = elapsedtime+delta
#	if elapsedtime >= 1 and not coucouprinted:
#		print("coucou")
#		coucouprinted = true
#		$rectangle.modulate = Color.from_hsv (randf(),1,1)
