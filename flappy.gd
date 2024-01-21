extends Node2D

@onready var zebird_scn = preload("res://zebird.tscn")
@onready var wall_scn = preload("res://wall.tscn")
var how_many_walls = 0

func _ready():
	$tick_wallspawn.timeout.connect(another_brick)
	gamu_sutaruto()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func on_gameover(_area):
	print("game over")
	$zebirds.get_child(0).queue_free()
	var walls = $zewalls.get_children()
	for zob in walls :
		zob.queue_free()
	gamu_sutaruto()
	
	
func another_brick():
	$zewalls.add_child(wall_scn.instantiate())

func gamu_sutaruto():
	await get_tree().create_timer(1).timeout
	var bird = zebird_scn.instantiate()
	$zebirds.add_child(bird)
#	var flappy_bird = $zebirds.get_child(0)
	var area = bird.get_node("hitbox") as Area2D
	area.area_entered.connect(on_gameover)

func _input(_event):
	pass
