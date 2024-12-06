# extends GutTest

# var ss_scene = load("res://src/2022/05/SupplyStacks.tscn")
# var ss

# func before_each():
# 	ss = autofree(ss_scene.instance())
# 	add_child(ss)

# func test_parse_crates():
# 	var crates = ss.parse_crates("example.txt")
# 	assert_eq_deep(crates,
# 		{
# 			"1": ["N", "Z"],
# 			"2": ["D", "C", "M"],
# 			"3": ["P"],
# 			}
# 		)

# func test_parse_moves():
# 	var moves = ss.parse_moves("example.txt")
# 	assert_eq_deep(moves,
# 		[
# 			{
# 				"count": 1,
# 				"from": "2",
# 				"to": "1",
# 				},
# 			{
# 				"count": 3,
# 				"from": "1",
# 				"to": "3",
# 				},
# 			{
# 				"count": 2,
# 				"from": "2",
# 				"to": "1",
# 				},
# 			{
# 				"count": 1,
# 				"from": "1",
# 				"to": "2",
# 				}
# 			]
# 		)

# func test_9000_example():
# 	assert_eq("CMZ", ss.top_crates(ss.move_9000("example.txt")))

# func test_9000_input():
# 	assert_eq("TPGVQPFDH", ss.top_crates(ss.move_9000()))

# func test_9001_example():
# 	assert_eq("MCD", ss.top_crates(ss.move_9001("example.txt")))

# func test_9001_input():
# 	assert_eq("DMRDFRHHH", ss.top_crates(ss.move_9001()))
