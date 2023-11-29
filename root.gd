extends Node2D

#var elapsedtime = 0.
#var coucouprinted = false
#var frame = 0
#var which_color = 0
#var colors = [Color.RED, Color.BLUE, Color.GREEN, Color.NAVAJO_WHITE, Color.BLUE_VIOLET]

	# Variables du Level
var width = ProjectSettings.get_setting("display/window/size/viewport_width")
var height = ProjectSettings.get_setting("display/window/size/viewport_height")
var edgeleft = (width/100)*2
var edgeright = width-edgeleft
var edgetop = (height/100)*2
var edgebottom = height-edgetop

	# VARIABLES DE LA BALLE
var SPEEDMAX = 600  #pixels par seconde
var speedx = 0
var speedy = 0


	# Variables des Players
@onready var playerone = $playerone
@onready var playertwo = $playertwo
var speed1 = 0
var speed2 = 0
var playerSPEEDMAX = 6

	# Variables player One
@onready var playerone_size_y = playerone.size.y
@onready var playerone_size_x = playerone.size.x
var playerone_cango_up = true
var playerone_cango_down = true

	# Variables player Two
@onready var playertwo_size_y = playerone_size_y
@onready var playertwo_size_x = playerone_size_x
var playertwo_cango_up = true
var playertwo_cango_down = true








func _ready():

		#VARIABLES DES PLAYERS
#	var players_edgeleft = edgeleft + playerone_size_x
#	var players_edgeright = edgeright - playerone_size_x
#	var players_edgetop = edgetop + (playerone_size_y / 2)
#	var players_edgebottom = edgebottom - (playerone_size_y / 2)

		# ON START
	playerone.position.x = edgeleft
	playerone.position.y = edgetop
	playertwo.position.x = edgeright
	playertwo.position.y = edgebottom - playertwo_size_y
	$theball.position.x = width/2
	$theball.position.y = height/2

func _process(_delta):

		# PLAYERS EDGES
		# meh...
	if playerone.position.y >= (edgebottom - playerone_size_y):
		playerone_cango_down = false
	if playerone.position.y <= edgetop :
		playerone_cango_up = false
	if playerone.position.y < (edgebottom - playerone_size_y):
		playerone_cango_down = true
	if playerone.position.y > edgetop :
		playerone_cango_up = true
	
	print(playerone.position.y)
	
		# VITESSE DES PLAYERS 
		# IL FAUT SE DEBARASSER DU ELSE (TERNARY INCOMPATIBILITY)
	if not Input.is_physical_key_pressed(KEY_W) and not Input.is_physical_key_pressed(KEY_S) :
		speed1 = 0
	speed1 += .5 if Input.is_physical_key_pressed(KEY_S) and speed1 <= playerSPEEDMAX else 0
	speed1 += -.5 if Input.is_physical_key_pressed(KEY_W) and speed1 <= playerSPEEDMAX else 0


	if not Input.is_physical_key_pressed(KEY_O) and not Input.is_physical_key_pressed(KEY_L):
		speed2 = 0
	if playertwo.position.y <= edgebottom and playertwo.position.y >= edgetop:
		speed2 += -.5 if Input.is_physical_key_pressed(KEY_O) and speed2 <= playerSPEEDMAX else 0
		speed2 += .5 if Input.is_physical_key_pressed(KEY_L) and speed2 <= playerSPEEDMAX else 0


	playerone.position.y += speed1
	playertwo.position.y += speed2


		# MOUVEMENTS de LA BALLE
	
	var deplacement = Vector2(speedx, speedy)
	deplacement = deplacement.normalized()
	$theball.position += deplacement * _delta * SPEEDMAX
#	$theball.position.x += speedx * _delta
#	$theball.position.y += speedy * _delta

func _input(ev):
	pass
	
