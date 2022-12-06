tool
extends Node2D

# TODO move to util
func partition(arr, n):
	var groups = []
	var last_group = []
	for i in range(len(arr)):
		if i % n == 0 and last_group:
			groups.append(last_group.duplicate())
			last_group = []
		last_group.append(arr[i])
	if last_group:
		groups.append(last_group)

	return groups

func str_to_set(s):
	var dict = {}
	for c in s:
		dict[c] = true
	return dict

func first_overlapping_key(d1, d2, d3=null):
	for k in d1.keys():
		if d2.has(k):
			if d3:
				if d3.has(k):
					return k
			else:
				return k

	print("[WARN] expected common key between", d1, d2, d3)

func item_to_priority(k):
	var char_code = k.ord_at(0)

	if char_code >= 97:
		return char_code - 96
	else:
		return char_code - 38

func parse_lines(fname = "input.txt"):
	return Util.file_lines(str("res://src/2022/03/", fname))

func parse_rucksacks(fname = "input.txt"):
	var lines = parse_lines(fname)

	var sacks = []
	for l in lines:
		var half = int(len(l) / 2.0)
		var comp1 = l.substr(0, half)
		var comp2 = l.substr(half, half)
		sacks.append({"comp1": comp1, "comp2": comp2})

	return sacks

func set_common_item(rucksack):
	var comp1_set = str_to_set(rucksack["comp1"])
	var comp2_set = str_to_set(rucksack["comp2"])
	var common = first_overlapping_key(comp1_set, comp2_set)

	rucksack["common"] = common
	return rucksack

func set_priority(rucksack):
	var updated = set_common_item(rucksack)
	updated["priority"] = item_to_priority(updated["common"])
	return updated

func total_rucksack_priority(rucksacks):
	var total = 0
	for r in rucksacks:
		set_priority(r)
		total += r["priority"]
	return total

func common_group_item(lines):
	var ds = []
	for l in lines:
		ds.append(str_to_set(l))

	return callv("first_overlapping_key", ds)

func total_rucksack_group_priority(lines):
	# move to groups of 3
	var groups = partition(lines, 3)

	# find common item among each group
	var total = 0

	for g in groups:
		var item = common_group_item(g)
		total += item_to_priority(item)
	return total

func _ready():
	if Engine.editor_hint:
		request_ready()

	var rucksacks = parse_rucksacks("example.txt")
	var total = total_rucksack_priority(rucksacks)
	print("\npart 1")
	print(total)

	var lines = parse_lines("example.txt")
	var total2 = total_rucksack_group_priority(lines)
	print("\npart 2")
	print(total2)
