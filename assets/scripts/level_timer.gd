extends Node2D

@export var seconds_remaining := 30
var text
signal one_second

func _ready():
    var timer = $Timer
    timer.connect("timeout", update_time)
    text = $RichTextLabel
    text.text = str(seconds_remaining)

func update_time():
    seconds_remaining -= 1
    text.text = str(seconds_remaining)
    one_second.emit()
