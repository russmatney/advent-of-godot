extends GutTest

var scene = load("res://src/2022/07/NoSpaceLeftOnDevice.tscn")
var s

func before_each():
	s = autofree(scene.instance())
	add_child(s)


func test_parse_dir_sizes():
	var dirs = s.parse_dir_sizes("example.txt")

	assert_eq_deep(dirs,
		{"/": {
			"size": 23352670,
			"dirs": [["/", "a"], ["/", "d"]],
			},
			"//a": {
				"size": 94269,
				"dirs": [["/", "a", "e"]]
				},

			"//a/e": {
				"size": 584,
				"dirs": []
				},

			"//d": {
				"size": 24933642,
				"dirs": []
				}
			}
		)
