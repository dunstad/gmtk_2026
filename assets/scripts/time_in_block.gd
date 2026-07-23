extends "res://assets/scripts/time_block.gd"

func update_time(change: int):
    super.update_time(change)
    if seconds_remaining <= 0 && !tilemap_layer.collision_enabled:
        tilemap_layer.collision_enabled = true
        animation_player.play("time_in")
    
    if seconds_remaining > 0 && tilemap_layer.collision_enabled:
        tilemap_layer.collision_enabled = false
        animation_player.play("time_out")