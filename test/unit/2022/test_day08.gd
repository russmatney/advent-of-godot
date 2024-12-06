# extends GutTest

# var tth_scene = load("res://src/2022/08/TreetopTreeHouse.tscn")
# var tth

# func before_each():
# 	tth = autofree(tth_scene.instance())
# 	add_child(tth)

# func test_parse_grid():
# 	var grid = tth.parse_grid("example.txt")

# 	assert_eq(grid["00"], 4)
# 	assert_eq(grid["44"], 4)
# 	assert_eq(grid["22"], 5)
