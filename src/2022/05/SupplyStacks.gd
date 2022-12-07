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
	var move_lines = moves_raw.split("\n", false)

	var moves = []
	for l in move_lines:
		var s = l.split(" ")
		moves.append({
			"count": int(s[1]),
			"from": s[3],
			"to": s[5]
			})

	return moves

func move_9000(f="input.txt"):
	var crates = parse_crates(f)
	var moves = parse_moves(f)

	for move in moves:
		var ct = move["count"]
		var from = move["from"]
		var to = move["to"]

		for c in range(ct):
			var crate = crates[from].pop_front()
			crates[to].push_front(crate)

	return crates


func move_9001(f="input.txt"):
	var crates = parse_crates(f)
	var moves = parse_moves(f)

	for move in moves:
		var ct = move["count"]
		var from = move["from"]
		var to = move["to"]

		var cs = []
		for c in range(ct):
			cs.push_front(crates[from].pop_front())

		for c in cs:
			crates[to].push_front(c)

	return crates

func top_crates(crates):
	var top = ""
	var ks = crates.keys()
	ks.sort()
	for k in ks:
		top += crates[k][0]
	return top

func _ready():
	if Engine.editor_hint:
		request_ready()

	# print("9000", move_9000("example.txt"))
	# print("9000", top_crates(move_9000("example.txt")))

	# print("9000", move_9000())
	# print("9000", top_crates(move_9000()))

	# print("9001", move_9001("example.txt"))
	# print("9001", top_crates(move_9001("example.txt")))

	# print("9001", move_9001())
	# print("9001", top_crates(move_9001()))
