extends GutTest

var calorie_counting = load("res://src/2022/01/CalorieCounting.tscn")

var c

func before_each():
	c = autofree(calorie_counting.instance())
	add_child(c)

func test_elf_inventories_f_handling():
	var res = c.elf_inventories("example.txt")
	assert_eq_deep(res,
		[
			[1000, 2000, 3000],
			[4000],
			[5000, 6000],
			[7000, 8000, 9000],
			[10000],
		])
