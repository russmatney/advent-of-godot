extends GutTest

var rr_scene = load("res://src/2022/03/RucksackReorg.tscn")
var rr

func before_each():
	rr = autofree(rr_scene.instance())
	add_child(rr)

func test_rucksack_parsing():
	var result = rr.parse_rucksacks("example.txt")
	assert_eq_deep(result,
		[
			{"comp1": "vJrwpWtwJgWr", "comp2": "hcsFMMfFFhFp"},
			{"comp1":"jqHRNqRjqzjGDLGL", "comp2":"rsFMfFZSrLrFZsSL"},
			{"comp1":"PmmdzqPrV", "comp2":"vPwwTWBwg"},
			{"comp1":"wMqvLMZHhHMvwLH", "comp2":"jbvcjnnSBnvTQFn"},
			{"comp1":"ttgJtRGJ", "comp2":"QctTZtZT"},
			{"comp1":"CrZsJsPPZsGz", "comp2":"wwsLwLmpwMDw"},
		])

func test_common_rucksack_item():
	var updated = rr.set_common_item(
		{"comp1": "vJrwpWtwJgWr", "comp2": "hcsFMMfFFhFp"}
		)
	assert_eq(updated["common"], "p")

func test_item_to_priority():
	assert_eq(1, rr.item_to_priority("a"))
	assert_eq(27, rr.item_to_priority("A"))
	assert_eq(26, rr.item_to_priority("z"))
	assert_eq(52, rr.item_to_priority("Z"))

func test_total_rucksack_priority():
	var rucksacks = rr.parse_rucksacks("example.txt")
	var total = rr.total_rucksack_priority(rucksacks)
	assert_eq(total, 157)

func test_total_rucksack_priority_input():
	var rucksacks = rr.parse_rucksacks("input.txt")
	var total = rr.total_rucksack_priority(rucksacks)
	assert_eq(total, 7872)

func test_common_group_item():
	var lines = [
		"vJrwpWtwJgWrhcsFMMfFFhFp",
		"jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
		"PmmdzqPrVvPwwTWBwg",
		]
	var c = rr.common_group_item(lines)
	assert_eq(c, "r")

func test_total_rucksack_group_priority():
	var lines = rr.parse_lines("example.txt")
	var total = rr.total_rucksack_group_priority(lines)
	assert_eq(total, 70)

func test_total_rucksack_group_priority_input():
	var lines = rr.parse_lines("input.txt")
	var total = rr.total_rucksack_group_priority(lines)
	assert_eq(total, 2497)
