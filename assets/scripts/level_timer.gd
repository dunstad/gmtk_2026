extends Node2D

@export var seconds_remaining := 30
var text
var timer : Timer
var current_seconds: int
signal one_second(change: int)

func _ready():
    current_seconds = seconds_remaining
    timer = $Timer
    timer.connect("timeout", update_time)
    text = $RichTextLabel
    text.text = str(current_seconds)

func update_time(change = -1):
    current_seconds += change
    text.text = str(current_seconds)
    one_second.emit(change)

func add_time(seconds: int):
    timer.start(1)
    update_time(seconds)

func restart():
    add_time(seconds_remaining - current_seconds)