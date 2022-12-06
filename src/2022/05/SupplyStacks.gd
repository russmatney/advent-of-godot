tool
extends Node2D

func parse_crates(f="input.txt"):
	var content = Util.file_content(f)
	# TODO split and parse crates
	return content

func parse_moves(f="input.txt"):
	var content = Util.file_content(f)
	# TODO split and parse moves
	return content

func _ready():
	if Engine.editor_hint:
		request_ready()

	print("ready")
