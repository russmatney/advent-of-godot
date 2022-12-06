tool
extends Node2D


func letter_to_move(letter):
	match letter:
		"A", "X": return "rock"
		"B", "Y": return "paper"
		"C", "Z": return "scissors"

func strategy_guide(fname = "input.txt"):
	var content = Util.file_content(str("res://src/2022/02/", fname))

	var guide = []
	for l in content.split("\n", false):
		var moves = l.split(" ")
		guide.append({"them": moves[0], "us": moves[1]})

	return guide

func update_guide(guide):
	var updated = []
	for turn in guide:
		var n = {}
		n["them"] = turn["them"]
		match turn["us"]:
			"X": match turn["them"]:
				# lose
				"A": n["us"] = "Z"
				"B": n["us"] = "X"
				"C": n["us"] = "Y"
			"Y": match turn["them"]:
				# tie
				"A": n["us"] = "X"
				"B": n["us"] = "Y"
				"C": n["us"] = "Z"
			"Z": match turn["them"]:
				# win
				"A": n["us"] = "Y"
				"B": n["us"] = "Z"
				"C": n["us"] = "X"
		updated.append(n)
	return updated

func move_score(move):
	match move:
		"rock": return 1
		"paper": return 2
		"scissors": return 3

func win_score(us, them):
	if us == them:
		return 3

	match us:
		"rock": match them:
			"paper": return 0
			"scissors": return 6
		"paper": match them:
			"scissors": return 0
			"rock": return 6
		"scissors": match them:
			"rock": return 0
			"paper": return 6

func total_score(guide):
	var score = 0
	for turn in guide:
		var them = letter_to_move(turn["them"])
		var us = letter_to_move(turn["us"])

		var move_score = move_score(us)
		var win_score = win_score(us, them)

		score += move_score + win_score

	return score

func _ready():
	if Engine.editor_hint:
		request_ready()

	# var strat_guide = strategy_guide("example.txt")

	# var updated_guide = update_guide(strat_guide)

	# print("\nscore", total_score(strat_guide))
	# print("\npart 2 score", total_score(updated_guide))
