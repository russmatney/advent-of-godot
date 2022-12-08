extends GutTest

var calorie_counting = load("res://src/2022/01/CalorieCounting.tscn")
var c

func before_each():
	c = autofree(calorie_counting.instance())
	add_child(c)

func test_elf_inventories_parsing():
	var res = c.elf_inventories("example.txt")
	assert_eq_deep(res,
		[
			[1000, 2000, 3000],
			[4000],
			[5000, 6000],
			[7000, 8000, 9000],
			[10000],
		])

func test_largest_inventory_example():
	var largest = c.largest_inventory(c.elf_inventories("example.txt"))
	assert_eq(24000, largest)

func test_largest_inventory_input():
	var largest = c.largest_inventory(c.elf_inventories("input.txt"))
	assert_eq(69501, largest)

func test_largest_3_inventory_example():
	var largest = c.largest_inventory(c.elf_inventories("example.txt"), 3)
	assert_eq(45000, largest)

func test_largest_3_inventory_input():
	var largest = c.largest_inventory(c.elf_inventories("input.txt"), 3)
	assert_eq(202346, largest)
