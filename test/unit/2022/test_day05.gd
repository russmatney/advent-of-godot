extends GutTest

var ss_scene = load("res://src/2022/05/SupplyStacks.tscn")
var ss

func before_each():
	ss = autofree(ss_scene.instance())
	add_child(ss)

func test_parse_crates():
	var crates = ss.parse_crates("example.txt")
	assert_eq_deep(crates,
		{
			"1": [],
			"2": [],
			"3": [],
			}
		)

func test_parse_moves():
	var moves = ss.parse_moves("example.txt")
	assert_eq_deep(moves,
		[
			{
				"count": 1,
				"from": 1,
				"to": 1,
				}
			]
		)
