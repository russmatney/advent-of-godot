extends Camera2D

export (String) var follow_group

var to_follow = []

func _ready():
	if follow_group:
		to_follow = get_tree().get_root().find_nodes_in_group(follow_group)
	else:
		print("[WARN][CAMERA]: no follow_group indicated")
