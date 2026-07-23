extends Area2D

@export var next_scene: PackedScene
@onready var animation_player := $AnimationPlayer

func _ready():
	body_entered.connect(on_body_entered)
	animation_player.play("fade_in")
	$Fade.visible = true
	animation_player.connect("animation_finished", load_next_scene)

func on_body_entered(body):
	if (body is Player):
		animation_player.play("fade_out")

func load_next_scene(animation_name):
	if animation_name == "fade_out":
		var root = get_tree().get_root()
		root.get_child(0).queue_free()
		var new_scene = next_scene.instantiate()
		root.add_child(new_scene)
