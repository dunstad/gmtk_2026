extends Node2D

@export var seconds_remaining := 30
var text
var timer : Timer
signal one_second(change: int)

func _ready():
    timer = $Timer
    timer.connect("timeout", update_time)
    text = $RichTextLabel
    text.text = str(seconds_remaining)

func update_time(change = -1):
    seconds_remaining += change
    text.text = str(seconds_remaining)
    one_second.emit(change)

func add_time(seconds: int):
    timer.start(1)
    update_time(1)