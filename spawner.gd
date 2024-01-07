extends Node2D

@onready var ball_scn = preload("res://ball.tscn")

var mouse_position: Vector2
var time_elapsed = 0 # temps en secondes

func _input(event):
	if event is InputEventMouse:
		mouse_position = event.global_position
	if event is InputEventMouseButton:
		if event.is_pressed() and not event.is_echo():
			_on_mouse_button_pressed(event.button_index)

func _ready():
	$%spawn_10_balls.pressed.connect(spawn_10_balls_randomly)
	$%spawn_spread_angle.pressed.connect(spawn_spread_angle)
	$%spawn_line_up.pressed.connect(spawn_in_line)

func _on_mouse_button_pressed(quel_bouton: int):
	spawn_ball(mouse_position, 0, remap(quel_bouton, 0,5, 0,1))

func spawn_in_line():
	var posx = 640
	var posy = 360
	var pos = Vector2(posx, posy)
	var ang = deg_to_rad(45)
	var balls_lined = 0
	while balls_lined < 8 :
		ang += deg_to_rad(45)
		pos.x += 40
		pos.y += 5
		spawn_ball(pos, ang)
		balls_lined += 1

func spawn_ball(_position: Vector2, _angle: float, _hue: float = 0):
	var ball = ball_scn.instantiate()
	ball.speed = 40
	ball.position = _position
	ball.angle = _angle
	ball.hue = _hue
	$balls.add_child(ball)

#func spawn_spread_angle():
#	var pos = Vector2(640,360)
#	var ang = deg_to_rad(randf_range(0,360))
#	var balls_spawned = 0
#	while balls_spawned < 10 :
#		ang += deg_to_rad(36)
#		spawn_ball(pos, ang)
#		balls_spawned += 1
	
#func spawn_spread_angle():
#	var pos = Vector2(640,360)
#	var ang = deg_to_rad(randf_range(0,360))
#	var balls_spawned = 0
#	var balls_to_spawn = randi_range(6,18)
#	var hue = remap(balls_to_spawn, 6, 18, 0, 1)     #HYPER PRATIQUE
#	while balls_spawned < balls_to_spawn:
#		ang += deg_to_rad(360) / balls_to_spawn
#		spawn_ball(pos, ang, hue)
#		balls_spawned += 1

func spawn_spread_angle():
	var pos = Vector2(640,360)
	var ang = deg_to_rad(randf_range(0,360))
	var balls_spawned = 0
	var balls_to_spawn = randf_range(6,18)
	var hue = remap(balls_to_spawn, 6, 18, 0, 1)     #HYPER PRATIQUE
	while balls_spawned < balls_to_spawn:
		await get_tree().create_timer(.05).timeout
		ang += deg_to_rad(360) / balls_to_spawn
		balls_spawned += 1
		spawn_ball(pos, ang, hue)


#######

func spawn_10_balls_randomly():
	spawn_n_balls(10)

func spawn_n_balls(number: int):
	print("spawn "+ str(number) + " balls")
	var balls_spawned = 0
	while balls_spawned < number:
		spawn_ball_random_position()
		balls_spawned += 1

func spawn_ball_random_position():
	var pos = Vector2(randf_range(0,1280), randf_range(0,720))
	var ang = deg_to_rad(randf_range(0,360))
	spawn_ball(pos, ang)

func _process(delta):
	time_elapsed += delta
