tool
extends Node2D

func file_content(fname):
	var fpath = str("res://src/2022/01/", fname)

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


func elf_inventories(fname = "input.txt"):
	var content = file_content(fname)
	print(content)
	return content

func _ready():
	if Engine.editor_hint:
		request_ready()

	# elf_inventories("input.txt")
	elf_inventories("example.txt")
