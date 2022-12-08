extends Camera2D

export (String) var follow_group

var to_follow = []
var zoom_offset = Vector2(100, 100)
var window_size = OS.window_size

func _ready():
	if follow_group:
		update_follows()
	else:
		print("[WARN][CAMERA]: no follow_group indicated")
	update_window_size()

	var _x = get_tree().connect("screen_resized", self, "update_window_size")

func update_window_size():
	window_size = OS.window_size

func update_follows():
	if follow_group:
		to_follow = get_tree().get_nodes_in_group(follow_group)

func _process(_delta):
	if not to_follow:
		update_follows()

	if to_follow:
		var center = Vector2.ZERO

		var max_left
		var max_right
		var max_top
		var max_bottom

		for obj in to_follow:
			center += obj.global_position

			if not max_left:
				max_left = obj.global_position.x
			if not max_right:
				max_right = obj.global_position.x
			if not max_top:
				max_top = obj.global_position.y
			if not max_bottom:
				max_bottom = obj.global_position.y

			if obj.global_position.x < max_left:
				max_left = obj.global_position.x
			if obj.global_position.x > max_right:
				max_right = obj.global_position.x
			if obj.global_position.y < max_top:
				max_top = obj.global_position.y
			if obj.global_position.y > max_bottom:
				max_bottom = obj.global_position.y

		center = center / to_follow.size()
		self.global_position = center

		var zoom_factor1 = abs(max_right - max_left) / (window_size.x - zoom_offset.x)
		var zoom_factor2 = abs(max_bottom - max_top) / (window_size.y - zoom_offset.y)
		var zoom_factor = max(max(zoom_factor1, zoom_factor2), 0.5)

		self.zoom = Vector2(zoom_factor, zoom_factor)
