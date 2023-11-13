extends Node2D	

var air = 1.
var jai = 1.
var bai = 1.
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

	$player.modulate = Color(air, jai, bai)

	if islooped == true:
		if  $player.position.y >= height/10:
			$player.position.y = $player.position.y -2
		if  $player.position.y <= height/10 && $player.position.x <= width/18*17:
			$player.position.x = $player.position.x +4
	#At the end of first path, ignore what's up there ^
		if  $player.position.x >= width/18*17:
			islooped = false
			print("islooped is now false")

	if islooped == false:
		# Close to the edge
		if  $player.position.x >= width/18*17:
			axisx = false
			air = randf()
			jai = randf()
			bai = randf()
			print("go left")
		if  $player.position.x <= width/18:
			axisx = true
			air = randf()
			jai = randf()
			bai = randf()
			print("go right")
		if  $player.position.y >= height/10*9:
			axisy = false
			air = randf()
			jai = randf()
			bai = randf()
			print("go up")
		if  $player.position.y <= height/10:
			axisy = true
			air = randf()
			jai = randf()
			bai = randf()
			print("go down")


		if  axisx == true:
			$player.position.x = $player.position.x +2
		if  axisx == false:
			$player.position.x = $player.position.x -2
		if  axisy == true:
			$player.position.y = $player.position.y +2
		if  axisy == false:
			$player.position.y = $player.position.y -2
