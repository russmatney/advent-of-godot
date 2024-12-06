extends Object
class_name AOC2024Day02

# parse into a useful datastructure

static func input(fname):
	var lines = Util.file_lines(str("res://src/2024/02/", fname, ".txt"))

	var reports = []
	for line in lines:
		reports.append(Array(line.split_floats(" ")).map(func(x): return int(x)))

	return reports


# part 1
static func calc_part_one(reports):
	var result = 0
	return result

# part 2
static func calc_part_two(data):
	var result = 0
	return result
