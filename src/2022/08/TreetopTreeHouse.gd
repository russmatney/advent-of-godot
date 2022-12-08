tool
extends Node2D

func parse_grid(f="input.txt"):
	var contents = Util.file_content(f)

	return contents

func _ready():
	if Engine.editor_hint:
		request_ready()
