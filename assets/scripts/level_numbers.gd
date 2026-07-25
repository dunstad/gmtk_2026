extends RichTextLabel

func _ready():
	var file_name : String = get_parent().get_parent().get_scene_file_path()  # e.g., "level_1.tscn"
	file_name = file_name.split("/")[-1]
	file_name = file_name.trim_suffix(".tscn")  # Remove the ".tscn" extension
	file_name = file_name.replace("_", " ")  # Replace underscores with spaces
	file_name = file_name.capitalize()  # Convert to proper case
	text = file_name
