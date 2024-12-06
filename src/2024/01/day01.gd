extends Object
class_name AOC2024Day01



static func input(fname):
	var content = Util.file_content(str("res://src/2024/01/", fname, ".txt"))
	Log.pr(content)
	return content
