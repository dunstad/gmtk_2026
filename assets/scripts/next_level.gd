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
		var old_level = root.get_child(0).find_child("BaseLevel", true, false)
		if old_level != null:
			old_level.get_parent().remove_child((old_level))
			old_level.queue_free()
			var new_scene = next_scene.instantiate()
			root.get_child(0).add_child(new_scene)
			new_scene.name = "BaseLevel"
		else: # when running scenes directly in the editor (no Persistent node)
			old_level = root.get_child(0)
			old_level.get_parent().remove_child((old_level))
			old_level.queue_free()
			var new_scene = next_scene.instantiate()
			root.add_child(new_scene)
			new_scene.name = "BaseLevel"
