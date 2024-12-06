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
static func is_safe(report):
	# all increasing or decreasing
	# at least different by 1
	# at most different by 3

	var is_increasing = false
	if report[0] < report[1]:
		is_increasing = true
	elif report[0] == report[1]:
		return false

	var last_val = null
	for val in report:
		if last_val == null:
			last_val = val
			continue

		var diff = val - last_val

		if is_increasing:
			if diff < 0:
				return false
		else:
			if diff > 0:
				return false

		if diff == 0 or abs(diff) > 3:
			return false

		last_val = val

	return true

static func calc_part_one(reports):
	var result = 0

	for report in reports:
		if is_safe(report):
			result += 1

	return result

# part 2
static func permute_report(report):
	var reps = []
	for i in range(len(report)):
		var dupe = report.duplicate()
		dupe.remove_at(i)
		reps.append(dupe)

	return reps

static func calc_part_two(reports):
	var result = 0
	for report in reports:
		if is_safe(report):
			result += 1
		else:
			var permuted_reports = permute_report(report)
			for rep in permuted_reports:
				if is_safe(rep):
					result += 1
					break


	return result
