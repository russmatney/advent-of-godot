extends GutTest

var calorie_counting = load("res://src/2022/01/CalorieCounting.tscn")

var c

func before_each():
	c = autofree(calorie_counting.instance())
	add_child(c)

func test_elf_inventories_f_handling():
	var res = c.elf_inventories("example.txt")
	assert_eq(res, "res://src/2022/01/example.txt")

	res = c.elf_inventories("example.txt")
	assert_eq(res, "res://src/2022/01/example.txt")
