extends Node2D
var text
@export var seconds_remaining := 3

@onready var animation_player := $AnimationPlayer
@onready var tilemap_layer := $TileMapLayer

func _ready():
	var timer = get_tree().get_nodes_in_group("LevelTimer")[-1]
	print(timer)
	timer.connect("one_second", update_time)
	text = $RichTextLabel
	text.text = str(seconds_remaining)

func update_time(change: int):
	seconds_remaining += change
	text.text = str(seconds_remaining)
