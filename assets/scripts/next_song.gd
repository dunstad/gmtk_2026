extends AudioStreamPlayer2D

@export var next_song: AudioStreamPlayer2D

func _ready():
    finished.connect(play_next_song)

func play_next_song():
    next_song.play()