extends GutTest

func before_each():
	gut.p("ran setup", 2)

func after_each():
	gut.p("ran teardown", 2)

func test_assert_eq_number():
	assert_eq(1, 1, "Should succeed.")
