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

func fully_contains(range_pair):
	return (range_pair[0] >= range_pair[2]
		and range_pair[1] <= range_pair[3]
		) or (range_pair[0] <= range_pair[2] and
		range_pair[1] >= range_pair[3])

func partially_contains(range_pair):
	var a1 = range_pair[0]
	var a2 = range_pair[1]
	var b1 = range_pair[2]
	var b2 = range_pair[3]
	return ((a1 >= b1 and a1 <= b2)
		or (a2 <= b2 and a2 >= b1)
		or (b1 >= a1 and b1 <= a2)
		or (b2 <= a2 and b2 >= a1))

func count_fully_contained_assignments(f):
	var count = 0
	for a in parse_assignments(f):
		if fully_contains(a):
			count += 1
	return count

func count_partially_contained_assignments(f):
	var count = 0
	for a in parse_assignments(f):
		if partially_contains(a):
			count += 1
	return count

func _ready():
	if Engine.editor_hint:
		request_ready()

	# print("asgmts: ", parse_assignments("example.txt"))
	# print("count (pt 1): ", count_fully_contained_assignments("example.txt"))
	# print("count (pt 1): ", count_fully_contained_assignments("input.txt"))

	# print("count (pt 2): ", count_partially_contained_assignments("example.txt"))
	# print("count (pt 2): ", count_partially_contained_assignments("input.txt"))
