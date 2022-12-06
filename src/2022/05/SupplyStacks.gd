tool
extends Node2D

func data_path(f):
	return str("res://src/2022/05/", f)

func parse_crates(f="input.txt"):
	var content = Util.file_content(data_path(f))

	var crates_raw = content.split("\n\n", false)[0]
	var crate_lines = Array(crates_raw.split("\n", false))
	var last = crate_lines.pop_back()
	var crate_nums = last.split(" ", false)

	var crates = {}
	for num in crate_nums:
		var idx = last.find(num)
		var crate_stack = []
		for l in crate_lines:
			var c = l.substr(idx, 1)
			if c and c != " ":
				crate_stack.append(c)

		crates[num] = crate_stack

	return crates

func parse_moves(f="input.txt"):
	var content = Util.file_content(data_path(f))

	var moves_raw = content.split("\n\n", false)[1]

	return content

func _ready():
	if Engine.editor_hint:
		request_ready()

	print("crates", parse_crates("example.txt"))
