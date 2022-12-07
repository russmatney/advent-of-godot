extends GutTest

var tt_scene = load("res://src/2022/06/TuningTrouble.tscn")
var tt

func before_each():
	tt = autofree(tt_scene.instance())
	add_child(tt)

func test_first_marker_pt1_example():
	var res = tt.first_marker(tt.sig("example.txt"), 4)
	assert_eq(res, 7)

func test_first_marker_pt1_input():
	var res = tt.first_marker(tt.sig("input.txt"), 4)
	assert_eq(res, 1235)

func test_first_marker_pt2_example():
	var res = tt.first_marker(tt.sig("example.txt"), 14)
	assert_eq(res, 19)

func test_first_marker_pt2_input():
	var res = tt.first_marker(tt.sig("input.txt"), 14)
	assert_eq(res, 3051)
