extends Area2D

func _ready():
	body_entered.connect(on_body_entered)

func on_body_entered(body):
	if (body is Player):
		body.restart()
		# print("!!!")