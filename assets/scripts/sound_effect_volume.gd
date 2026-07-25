extends AudioStreamPlayer2D

var starting_volume : float

func _ready():
    starting_volume = volume_linear

func _process(delta: float):
    var sfx_volume : float = PlayerConfig.get_config(AppSettings.AUDIO_SECTION, "Sfx", 1.0)
    # print(sfx_volume)
    volume_linear = starting_volume * sfx_volume