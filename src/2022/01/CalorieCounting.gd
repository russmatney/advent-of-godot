tool
extends Node2D

func elf_inventories(fname = "input.txt"):
	var content = Util.file_content(str("res://src/2022/01/", fname))

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

	# var invs = elf_inventories()
	# print(invs)
	# var largest = largest_inventory(invs, 3)
	# print(largest)
