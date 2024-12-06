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

static func calc_part_two(data):
	var left = data.left
	var right = data.right

	# calc frequencies for right
	var frequencies = {}
	for val in right:
		# already in dictionary?
		if not val in frequencies:
			frequencies[val] = 0
		# increment the value
		frequencies[val] += 1

	# loop over left calcing similarity score
	var score = 0
	for val in left:
		score += val * frequencies.get(val, 0)

	return score
