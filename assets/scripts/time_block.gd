class_name TimeBlock

extends Node2D
var text
@export var relative_time : TimeBlock
@export var seconds_remaining := 3

@onready var animation_player := $AnimationPlayer
@onready var tilemap_layer := $TileMapLayer

func _ready():
	while relative_time != null:
		seconds_remaining += relative_time.seconds_remaining
		relative_time = relative_time.relative_time

	var timer = get_tree().get_nodes_in_group("LevelTimer")[-1]
	# print(timer)
	timer.connect("one_second", update_time)
	text = $RichTextLabel
	text.text = str(seconds_remaining)

	self.update_time(0)

func update_time(change: int):
	seconds_remaining += change
	text.text = str(seconds_remaining)
