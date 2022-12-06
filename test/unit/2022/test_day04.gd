extends GutTest

var cc_scene = load("res://src/2022/04/CampCleanup.tscn")
var cc

func before_each():
	cc = autofree(cc_scene.instance())
	add_child(cc)

func test_parse_assignments():
	var assigns = cc.parse_assignments("example.txt")
	assert_eq_deep(assigns, [
		[2, 4, 6, 8],
		[2, 3, 4, 5],
		[5, 7, 7, 9],
		[2, 8, 3, 7],
		[6, 6, 4, 6],
		[2, 6, 4, 8]
		])
