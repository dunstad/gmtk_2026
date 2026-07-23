extends Area2D

@onready var animation_player := $AnimationPlayer
@export var text_animation_player : AnimationPlayer

func _ready():
	body_entered.connect(on_body_entered)
	animation_player.play("float")
	animation_player.animation_finished.connect(delete_on_grabbed)

func on_body_entered(body):
	if (body is Player):
		body.can_add_time = true
		animation_player.play("vanish")
		if text_animation_player != null:
			text_animation_player.play("text_in")

func delete_on_grabbed(animation_name):
	if animation_name == "vanish":
		queue_free()