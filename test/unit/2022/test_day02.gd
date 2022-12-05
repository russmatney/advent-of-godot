extends GutTest

var rps_scene = load("res://src/2022/02/RockPaperScissors.tscn")
var rps

func before_each():
	rps = autofree(rps_scene.instance())
	add_child(rps)

func test_strategy_guide_parsing():
	var res = rps.strategy_guide("example.txt")
	assert_eq_deep(res,
		[
			{"us": "Y", "them": "A"},
			{"us": "X", "them": "B"},
			{"us": "Z", "them": "C"},
		])

func test_part_1_example():
	var guide = rps.strategy_guide("example.txt")
	var score = rps.total_score(guide)
	assert_eq(score, 15)

func test_part_1_input():
	var guide = rps.strategy_guide()
	var score = rps.total_score(guide)
	assert_eq(score, 13268)

func test_part_2_example():
	var guide = rps.strategy_guide("example.txt")
	var updated_guide = rps.update_guide(guide)
	var score = rps.total_score(updated_guide)
	assert_eq(score, 12)

func test_part_2_input():
	var guide = rps.strategy_guide()
	var updated_guide = rps.update_guide(guide)
	var score = rps.total_score(updated_guide)
	assert_eq(score, 15508)
