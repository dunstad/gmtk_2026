extends "res://assets/scripts/time_block.gd"

func update_time(change: int):
    super.update_time(change)
    if seconds_remaining <= 0 && self.collision_enabled:
        self.collision_enabled = false
        animation_player.play("time_out")
    
    if seconds_remaining > 0 && !self.collision_enabled:
        self.collision_enabled = true
        animation_player.play("time_in")