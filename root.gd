extends Node2D

@onready var ball_scn = preload("res://ball.tscn")

func _ready():
	# $spawn_timer.timeout.connect(spawn_ball_random_position)
	$spawn_button.pressed.connect(spawn_10_balls)

func spawn_ball_random_position():
	var pos = Vector2(randf_range(0,1280), randf_range(0,720))
	var ang = deg_to_rad(randf_range(0,360))
	spawn_ball(pos, ang)

func spawn_ball(_position: Vector2, _angle: float):
	var ball = ball_scn.instantiate()
	ball.speed = 40
	ball.position = _position
	ball.angle = _angle
	$balls.add_child(ball)

func spawn_n_balls(number: int):
	print("spawn "+ str(number) + " balls")
	var balls_spawned = 0
	while balls_spawned < number:
		spawn_ball_random_position()
		balls_spawned += 1

func spawn_10_balls():
	spawn_n_balls(10)
