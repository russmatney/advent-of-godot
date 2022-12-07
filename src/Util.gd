tool
extends Node

func file_content(fpath):
	var f = File.new()

	if not f.file_exists(fpath):
		print("[WARN] file does not exist: ", fpath)
		return
	else:
		print("[OK] file exists: ", fpath)

	f.open(fpath, File.READ)
	var content = f.get_as_text()
	f.close()

	return content

func file_lines(fpath):
	var content = file_content(fpath)

	return content.split("\n", false)

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

func str_to_dict(s):
	var dict = {}
	for c in s:
		dict[c] = true
	return dict
