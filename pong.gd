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
var startimer = 0

	# VARIABLES DE LA BALLE
var SPEEDMAX = 500  #pixels par seconde
var speedx = 0
var speedy = 0


	# Variables des Players
@onready var playerone = $playerone
@onready var playertwo = $playertwo
var speed1 = 0
var speed2 = 0
var playerSPEEDMAX = 9
var playerone_score = 0
var playertwo_score = 0

	# Variables player One
@onready var playerone_size_y = playerone.size.y
@onready var playerone_size_x = playerone.size.x
#var playerone_cango_up = true
#var playerone_cango_down = true

	# Variables player Two
@onready var playertwo_size_y = playerone_size_y
@onready var playertwo_size_x = playerone_size_x








func _ready():

		#VARIABLES DES PLAYERS
#	var players_edgeleft = edgeleft + playerone_size_x
#	var players_edgeright = edgeright - playerone_size_x
#	var players_edgetop = edgetop + (playerone_size_y / 2)
#	var players_edgebottom = edgebottom - (playerone_size_y / 2)

		# ON START
	playerone.position.x = edgeleft
	playerone.position.y = edgetop
	playertwo.position.x = edgeright - playertwo_size_x
	playertwo.position.y = edgebottom - playertwo_size_y
		#le anchorpoint du sprite est bloqué en top left ^
	$theball.position.x = width/2
	$theball.position.y = height/2
	
	$playerone_score.position.x = width/2 - playerone_size_y
	$playertwo_score.position.x = width/2 + playertwo_size_y
	$playerone_score.position.y = edgetop
	$playertwo_score.position.y = edgetop


func _process(_delta):

		# GAMU SUTARUTO
	startimer = startimer + _delta
	if startimer >= 3 and startimer <= 4 :
		speedx = -1
		speedy = -1

		# PLAYERS EDGES
	if playerone.position.y < edgetop :
		playerone.position.y = edgetop
	if playerone.position.y > (edgebottom - playerone_size_y) :
		playerone.position.y = (edgebottom - playerone_size_y)
	if playertwo.position.y < edgetop :
		playertwo.position.y = edgetop
	if playertwo.position.y > (edgebottom - playertwo_size_y) :
		playertwo.position.y = (edgebottom - playertwo_size_y)


		# MOUVEMENTS DES PLAYERS 
	if not Input.is_physical_key_pressed(KEY_W) and not Input.is_physical_key_pressed(KEY_S) :
		speed1 = 0
	if Input.is_physical_key_pressed(KEY_S) and speed1 <= playerSPEEDMAX :
		speed1 += .5
	if Input.is_physical_key_pressed(KEY_W) and speed1 >= -playerSPEEDMAX :
		speed1 += -.5
	
	if not Input.is_physical_key_pressed(KEY_O) and not Input.is_physical_key_pressed(KEY_L) :
		speed2 = 0
	if Input.is_physical_key_pressed(KEY_L) and speed2 <= playerSPEEDMAX :
		speed2 += .5
	if Input.is_physical_key_pressed(KEY_O) and speed2 >= -playerSPEEDMAX :
		speed2 += -.5  
	
	playerone.position.y += speed1
	playertwo.position.y += speed2


		# MOUVEMENTS de LA BALLE
	var deplacement = Vector2(speedx, speedy)
	deplacement = deplacement.normalized()
	$theball.position += deplacement * _delta * SPEEDMAX
	if $theball.position.y <= edgetop :
		speedy = 1
	elif $theball.position.y >= edgebottom :
		speedy = -1
	
	if $theball.position.x <= playerone.position.x + playerone_size_x  :
		if $theball.position.y >= playerone.position.y and $theball.position.y <= (playerone.position.y + playerone_size_y) :
			speedx = 1
	if $theball.position.x >= playertwo.position.x - playertwo_size_x :
		if $theball.position.y >= playertwo.position.y and $theball.position.y <= (playertwo.position.y + playertwo_size_y) :
			speedx = -1

		# SCORING DE LA BALLE
	if $theball.position.x < 0 :
		playertwo_score += 1
		startimer = 0
		$theball.position.x = width/2
		$theball.position.y = height/2
		speedx = 0
		speedy = 0
	if $theball.position.x > width :
		playerone_score += 1
		startimer = 0
		$theball.position.x = width/2
		$theball.position.y = height/2
		speedx = 0
		speedy = 0

	$playerone_score.text = str(playerone_score)
	$playertwo_score.text = str(playertwo_score)

func _input(_ev):
	pass
