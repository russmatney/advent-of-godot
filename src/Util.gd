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
