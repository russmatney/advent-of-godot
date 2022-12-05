tool
extends Node2D


func strategy_guide(fname = "input.txt"):
	var content = Util.file_content(str("res://src/2022/02/", fname))

	# TODO parse guide

	return content

func update_guide(guide):
	# TODO update guide for part 2

	return guide

func total_score(guide):
	# TODO play out guide to calc score
	return 0

func _ready():
	if Engine.editor_hint:
		request_ready()

	var strat_guide = strategy_guide("example.txt")
	print("\nstrat_guide")
	print(strat_guide)
