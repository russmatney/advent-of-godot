tool
extends Node2D

var elves = []

var parsed_inventories = []
var data_fname = "input.txt"

######################################################

func _ready():
	if Engine.editor_hint:
		request_ready()

		# use the example data in the editor
		data_fname = "example.txt"
	# data_fname = "example.txt"

	parsed_inventories = $CalorieCounting.elf_inventories(data_fname)

	call_deferred("spawn_elves")

######################################################

func random_offset(n=10):
	return (randi() % n) - int(n / 2)

func spawn_elves():
	print("inventories: ", parsed_inventories.size())
	var batch = parsed_inventories.slice(0, 254)
	for inv in batch:
		var elf = create_elf(inv)
		elves.append(elf)

		elf.position.x += random_offset(1000)
		elf.position.y += random_offset(500)

		$ElfContainer.add_child(elf)

######################################################

var elf_scene = preload("res://src/2022/01/Elf.tscn")

func create_elf(inventory):
	var inst = elf_scene.instance()
	inst.assign_inventory(inventory)
	return inst
