tool
extends Node

func data_path(f):
	return str("res://src/2022/06/", f)

func sig(f):
	return Util.file_content(data_path(f))

func unique_chars(text):
	var ct = len(text)
	var t_dict = Util.str_to_dict(text)
	var unq_ct = t_dict.keys().size()
	return ct == unq_ct

func first_marker(text, n=4):
	for i in range(len(text)):
		var mark = text.substr(i, n)

		if unique_chars(mark):
			return i + n

func _ready():
	if Engine.editor_hint:
		request_ready()

	# print("ex: ", first_marker(sig("example.txt")))
	# print("in: ", first_marker(sig("input.txt")))

	# print("ex2: ", first_marker(sig("example.txt"), 14))
	# print("in2: ", first_marker(sig("input.txt"), 14))
