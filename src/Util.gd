@tool
extends Node
class_name Util

static func file_content(fpath):
	if not FileAccess.file_exists(fpath):
		Log.warn("file does not exist", fpath)
		return

	var file = FileAccess.open(fpath, FileAccess.READ)
	var content = file.get_as_text()

	return content

static func file_lines(fpath):
	var content = file_content(fpath)

	return content.split("\n", false)

static func partition(arr, n):
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

static func str_to_dict(s):
	var dict = {}
	for c in s:
		dict[c] = true
	return dict
