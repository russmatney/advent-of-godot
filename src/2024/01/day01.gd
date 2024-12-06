extends Object
class_name AOC2024Day01

static func input(fname):
	var content = Util.file_content(str("res://src/2024/01/", fname, ".txt"))
	var lines = content.split("\n", false)
	var left = []
	var right = []
	for line in lines:
		var floats = line.split_floats("   ")
		left.append(int(floats[0]))
		right.append(int(floats[1]))
	return {left=left, right=right}

static func calc_part_one(data):
	var left = data.left
	var right = data.right

	# sort the lists
	left.sort()
	right.sort()

	# calc the difference
	var dist = 0
	for i in range(len(left)):
		dist += abs(left[i] - right[i])

	return dist
