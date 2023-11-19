extends Node2D	

var ash = randi_range(0,360)
var ais = 100
var vai = 100
var axisx = true
var axisy = false
var islooped = true
var width = ProjectSettings.get_setting("display/window/size/viewport_width")
var height = ProjectSettings.get_setting("display/window/size/viewport_height")
# Called when the node enters the scene tree for the first time.

func _ready():

	$player.position.x = width/2
	$player.position.y = height/2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	$player.modulate = Color ("002aff")
	if islooped == true:
		if  $player.position.y >= height/10:
			$player.position.y = $player.position.y -2
		if  $player.position.y <= height/10 && $player.position.x <= width/18*17:
			$player.position.x = $player.position.x +4
	#At the end of first path, ignore what's up there ^
		if  $player.position.x >= width/18*17:
			islooped = false
			print("islooped is now false")
#
#	if islooped == false:
#		# Close to the edge
#		if  $player.position.x >= width/18*17:
#			axisx = false
#				air = globalcolor3[0]
#				jai = globalcolor3[1]
#				bai = globalcolor3[2]
#			print("go left")
#		if  $player.position.x <= width/18:
#			axisx = true
#			randomcolorvar = randi_range(1,3)
#			print(randomcolorvar)
#			if randomcolorvar == 1:
#				air = globalcolor1[0]
#				jai = globalcolor1[1]
#				bai = globalcolor1[2]
#			if randomcolorvar == 2:
#				air = globalcolor2[0]
#				jai = globalcolor2[1]
#				bai = globalcolor2[2]
#			if randomcolorvar == 3:
#				air = globalcolor3[0]
#				jai = globalcolor3[1]
#				bai = globalcolor3[2]
#			print("go right")
#		if  $player.position.y >= height/10*9:
#			axisy = false
#			randomcolorvar = randi_range(1,3)
#			print(randomcolorvar)
#			if randomcolorvar == 1:
#				air = globalcolor1[0]
#				jai = globalcolor1[1]
#				bai = globalcolor1[2]
#			if randomcolorvar == 2:
#				air = globalcolor2[0]
#				jai = globalcolor2[1]
#				bai = globalcolor2[2]
#			if randomcolorvar == 3:
#				air = globalcolor3[0]
#				jai = globalcolor3[1]
#				bai = globalcolor3[2]
#			print("go up")
#		if  $player.position.y <= height/10:
#			axisy = true
#			randomcolorvar = randi_range(1,3)
#			print(randomcolorvar)
#			if randomcolorvar == 1:
#				air = globalcolor1[0]
#				jai = globalcolor1[1]
#				bai = globalcolor1[2]
#			if randomcolorvar == 2:
#				air = globalcolor2[0]
#				jai = globalcolor2[1]
#				bai = globalcolor2[2]
#			if randomcolorvar == 3:
#				air = globalcolor3[0]
#				jai = globalcolor3[1]
#				bai = globalcolor3[2]
#			print("go down")
#
#
#		if  axisx == true:
#			$player.position.x = $player.position.x +2
#		if  axisx == false:
#			$player.position.x = $player.position.x -2
#		if  axisy == true:
#			$player.position.y = $player.position.y +2
#		if  axisy == false:
#			$player.position.y = $player.position.y -2
