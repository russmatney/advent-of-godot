# extends GutTest

# var scene = load("res://src/2022/07/NoSpaceLeftOnDevice.tscn")
# var s

# func before_each():
# 	s = autofree(scene.instance())
# 	add_child(s)


# func test_parse_dir_sizes():
# 	var dirs = s.parse_dir_sizes("example.txt")

# 	assert_eq_deep(dirs,
# 		{
# 			"/": {
# 				"size": 23352670,
# 				"dir_size": 48381165,
# 				"dirs": [["/", "a"], ["/", "d"]],
# 				},
# 			"//a": {
# 				"size": 94269,
# 				"dir_size": 94853,
# 				"dirs": [["/", "a", "e"]]
# 				},
# 			"//a/e": {
# 				"size": 584,
# 				"dir_size": 584,
# 				"dirs": []
# 				},
# 			"//d": {
# 				"size": 24933642,
# 				"dir_size": 24933642,
# 				"dirs": []
# 				}
# 			}
# 		)

# func test_sum_dirs_under_size_example():
# 	var dirs = s.parse_dir_sizes("example.txt")
# 	var result = s.sum_dirs_under_size(dirs)
# 	assert_eq(result, 95437)

# func test_sum_dirs_under_size_input():
# 	var dirs = s.parse_dir_sizes()
# 	var result = s.sum_dirs_under_size(dirs)
# 	assert_eq(result, 1915606)

# func test_smallest_dir_to_delete_example():
# 	var dirs = s.parse_dir_sizes("example.txt")
# 	var result = s.smallest_dir_to_delete(dirs, 30000000)
# 	assert_eq(result, 24933642)

# func test_smallest_dir_to_delete_input():
# 	var dirs = s.parse_dir_sizes()
# 	var result = s.smallest_dir_to_delete(dirs, 30000000)
# 	assert_eq(result, 5025657)
