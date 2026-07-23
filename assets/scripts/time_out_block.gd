extends "res://assets/scripts/time_block.gd"

func update_time():
    super.update_time()
    if seconds_remaining == 0:
        self.collision_enabled = false
        animation_player.play("time_out")