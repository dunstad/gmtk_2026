extends AudioStreamPlayer

@export var next_song: AudioStreamPlayer

func _ready():
    finished.connect(play_next_song)

func play_next_song():
    next_song.play()