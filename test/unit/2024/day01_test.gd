extends GdUnitTestSuite

func test_input_example():
	var data = AOC2024Day01.input("example")

	assert_that(data.left).is_equal([3, 4, 2, 1])
	assert_that(data.right).is_equal([4, 3, 5])
