extends GdUnitTestSuite

func test_input_example():
	var data = AOC2024Day02.input("example")
	assert_that(data[0]).is_equal([ 7, 6, 4, 2, 1 ])
	assert_that(data[len(data) - 1]).is_equal([ 1, 3, 6, 7, 9 ])

func test_part_one_example():
	pass

func test_part_one_input():
	pass