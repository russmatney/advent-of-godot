extends Control

onready var day_loader = $DayLoader
var day_label
var day_container
var part_one_result
var part_two_result

var current

var scenes = [
	preload("res://src/2022/01/CalorieCounting.tscn"),
	preload("res://src/2022/02/RockPaperScissors.tscn"),
	preload("res://src/2022/03/RucksackReorg.tscn"),
	preload("res://src/2022/04/CampCleanup.tscn"),
	preload("res://src/2022/05/SupplyStacks.tscn"),
	preload("res://src/2022/06/TuningTrouble.tscn"),
	preload("res://src/2022/07/NoSpaceLeftOnDevice.tscn"),
	preload("res://src/2022/08/TreetopTreeHouse.tscn"),
	]

func _ready():
	day_label = get_node("%DayLabel")
	day_container = get_node("%DayContainer")
	part_one_result = get_node("%PartOneResult")
	part_two_result = get_node("%PartTwoResult")

	for p in scenes:
		var tmp = p.instance()
		day_loader.add_item(tmp.name)

func _on_DaySelector_pressed():
	day_loader.popup_centered_ratio()


func _on_DayLoader_id_pressed(id:int):
	var s = scenes[id]
	current = s.instance()
	day_label.text = current.name

	for c in day_container.get_children():
		c.queue_free()

	day_container.add_child(current)

	part_one_result.text = ""
	part_two_result.text = ""


func _on_PartOne_pressed():
	if not current:
		print("no current, please select a day first")
		return

	if current.has_method("run_part_one"):
		var result = current.run_part_one()
		part_one_result.text = str(result)
	else:
		print("No run_part_one method on current scene")

func _on_PartTwo_pressed():
	if not current:
		print("no current, please select a day first")
		return

	if current.has_method("run_part_two"):
		var result = current.run_part_two()
		part_two_result.text = str(result)
	else:
		print("No run_part_two method on current scene")
