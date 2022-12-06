tool
extends Node2D


func parse_assignments(f = "input.txt"):
	var lines = Util.file_lines(str("res://src/2022/04/", f))

	var assignments = []
	for l in lines:
		var pairs = l.split(",", false)
		var range_pair = []
		for pair in pairs:
			var rng = pair.split("-", false)
			range_pair.append(int(rng[0]))
			range_pair.append(int(rng[1]))
		assignments.append(range_pair)

	return assignments


func _ready():
	if Engine.editor_hint:
		request_ready()

	print("asgmts: ", parse_assignments("example.txt"))
