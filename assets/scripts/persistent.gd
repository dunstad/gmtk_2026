extends Node

@export var child_scene: PackedScene

func _ready():
    var new_scene = child_scene.instantiate()
    add_child(new_scene)