extends Node2D


#var elapsedtime = 0.
#var coucouprinted = false
#var frame = 0
#var which_color = 0
#var colors = [Color.RED, Color.BLUE, Color.GREEN, Color.NAVAJO_WHITE, Color.BLUE_VIOLET]

	#Variables du Level
var width = ProjectSettings.get_setting("display/window/size/viewport_width")
var height = ProjectSettings.get_setting("display/window/size/viewport_height")
var edgeleft = (width/100)*2
var edgeright = width-edgeleft
var edgetop = (height/100)*2
var edgebottom = height-edgetop

	#Variables des Players
@onready var playerone = $playerone
@onready var playertwo = $playertwo
	#Variables player One
@onready var playerone_size_y = playerone.size.y
@onready var playerone_size_x = playerone.size.x
	#Variables player Two
@onready var playertwo_size_y = playerone_size_y
@onready var playertwo_size_x = playerone_size_x


var SPEED = 800  #pixels par seconde
var speedx = 0
var speedy = 0



	


func _ready():
	
	#VARIABLES DES PLAYERS
	var players_edgeleft = edgeleft + playerone_size_x
	var players_edgeright = edgeright - playerone_size_x
	var players_edgetop = edgetop + (playerone_size_y / 2)
	var players_edgebottom = edgebottom - (playerone_size_y / 2)
	
	
	playerone.position.x = players_edgeleft
	playerone.position.y = players_edgetop
	playertwo.position.x = players_edgeright
	playertwo.position.y = players_edgebottom

func _process(_delta):
	pass
#	frame += 1
#	var nbcolors = colors.size()
#	var tint = colors [which_color % nbcolors]
#	var should_i_tint = frame % 60
#	if should_i_tint == 0: 
#		rect.modulate = tint
#		which_color += 1
	
#	speedy = 0
#	speedy += -1 if Input.is_physical_key_pressed(KEY_W) else 0
#	speedy += 1 if Input.is_physical_key_pressed(KEY_S) else 0
#	speedx = 0
#	speedx += -1 if Input.is_physical_key_pressed(KEY_A) else 0
#	speedx += 1 if Input.is_physical_key_pressed(KEY_D) else 0
	
#	var  = Vector2(speedx, speedy)
#	deplacement = deplacement.normalized()
#	$rectangle.position += deplacement * delta * SPEED
#	$rectangle.position.x += speedx * delta
#	$rectangle.position.y += speedy * delta
	
#func _input(ev):
#	if ev is InputEventKey:
#		if ev.physical_keycode == KEY_SPACE and ev.is_pressed() and not ev.is_echo():
#			SPEED = 450 if SPEED == 300 else 300
	
#	elapsedtime = elapsedtime+delta
#	if elapsedtime >= 1 and not coucouprinted:
#		print("coucou")
#		coucouprinted = true
#		$rectangle.modulate = Color.from_hsv (randf(),1,1)
