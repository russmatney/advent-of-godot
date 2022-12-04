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

	content = content.split("\n\n", false)

	var tories = []
	for x in content:
		var cals = []
		for y in x.split("\n", false):
			cals.append(int(y))
		tories.append(cals)

	return tories

func total(inventory):
	var sum = 0
	for i in inventory:
		sum += i
	return sum

class Sorter:
	static func sort_descending(a, b):
		if a >= b:
			return true
		return false

func largest_inventory(inventories, n = 1):
	var totals = []
	for inv in inventories:
		totals.append(total(inv))

	totals.sort_custom(Sorter, "sort_descending")
	var ret = []
	for i in range(n):
		ret.append(totals[i])

	return total(ret)

func _ready():
	if Engine.editor_hint:
		request_ready()

	var invs = elf_inventories()
	# print(invs)
	var largest = largest_inventory(invs, 3)
	print(largest)
