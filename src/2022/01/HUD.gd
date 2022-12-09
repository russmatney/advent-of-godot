extends CanvasLayer

var sort_progress_bar
var elf_count_label
var elves = []

# Called when the node enters the scene tree for the first time.
func _ready():
	elf_count_label = get_node("%ElfCount")
	sort_progress_bar = get_node("%SortProgress")

func set_elf_count(n):
	elf_count_label.bbcode_text = str("[center]Elves: ", n)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# lol performance
	elves = get_tree().get_nodes_in_group("elf")
	set_elf_count(elves.size())


	update_sort_progress()

class Sorter:
	static func sort_by_x_pos(a, b):
		if a.global_position.x >= b.global_position.x:
			return true
		return false

func update_sort_progress():
	elves.sort_custom(Sorter, "sort_by_x_pos")

	# var sorted = 0
	# for e in elves:
