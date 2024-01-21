extends Node2D

@onready var zebird = preload("res://zebird.tscn")

func _ready():
	
	gamu_sutaruto()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func gamu_sutaruto():
	await get_tree().create_timer(1).timeout
	$zebirds.add_child(zebird.instantiate())

func _input(_event):
	pass
