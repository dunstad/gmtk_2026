extends AudioStreamPlayer

@export var next_song: AudioStreamPlayer
var starting_volume : float

func _ready():
    finished.connect(play_next_song)
    starting_volume = volume_linear

func _process(delta: float):
    var music_volume : float = PlayerConfig.get_config(AppSettings.AUDIO_SECTION, "Music", 1.0)
    volume_linear = starting_volume * music_volume

func play_next_song():
    next_song.play()