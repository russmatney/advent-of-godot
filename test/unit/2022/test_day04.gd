# extends GutTest

# var cc_scene = load("res://src/2022/04/CampCleanup.tscn")
# var cc

# func before_each():
# 	cc = autofree(cc_scene.instance())
# 	add_child(cc)

# func test_parse_assignments():
# 	var assigns = cc.parse_assignments("example.txt")
# 	assert_eq_deep(assigns, [
# 		[2, 4, 6, 8],
# 		[2, 3, 4, 5],
# 		[5, 7, 7, 9],
# 		[2, 8, 3, 7],
# 		[6, 6, 4, 6],
# 		[2, 6, 4, 8]
# 		])

# func test_count_fully_contained_example():
# 	assert_eq(2, cc.count_fully_contained_assignments("example.txt"))

# func test_count_fully_contained_input():
# 	assert_eq(515, cc.count_fully_contained_assignments("input.txt"))

# func test_count_partially_contained_example():
# 	assert_eq(4, cc.count_partially_contained_assignments("example.txt"))

# func test_count_partially_contained_input():
# 	assert_eq(883, cc.count_partially_contained_assignments("input.txt"))
