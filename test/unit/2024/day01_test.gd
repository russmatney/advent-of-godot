extends GdUnitTestSuite

func test_input_example():
	var data = AOC2024Day01.input("example")
	assert_that(data.left).is_equal([3, 4, 2, 1, 3, 3])
	assert_that(data.right).is_equal([4, 3, 5, 3, 9, 3])

func test_part_one_example():
	var data = AOC2024Day01.input("example")
	var result = AOC2024Day01.calc_part_one(data)
	assert_that(result).is_equal(11)

func test_part_one_input():
	var data = AOC2024Day01.input("input")
	var result = AOC2024Day01.calc_part_one(data)
	assert_that(result).is_equal(1666427)
