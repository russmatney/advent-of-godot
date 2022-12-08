tool
extends RigidBody2D

var inventory = []
var items = []
var total_calories = 0

var original_pos

enum DIR {stay, left, right}
var move_dir = DIR.stay

func _ready():
	if Engine.editor_hint:
		assign_inventory([1000, 2000])

	original_pos = global_position

func assign_inventory(inv):
	inventory = inv

	add_items()

var y_offset = 0

func add_item(cal_count, color=null):
	var it = create_item(cal_count)

	y_offset -= 16
	it.position.y += y_offset

	if color:
		it.update_background_color(color)

	$ItemContainer.add_child(it)

var total_green = Color(0.058824, 0.607843, 0.196078)

func add_items():
	total_calories = 0
	for cals in inventory:
		# TODO add delay
		add_item(cals)
		total_calories += cals

	add_item(total_calories, total_green)

var item_scene = preload("res://src/2022/01/Item.tscn")

func create_item(calories):
	var it = item_scene.instance()
	it.calories = calories
	return it

################################################################

func _process(_delta):

	# move towards original x position
	if global_position.y < original_pos.y:
		gravity_scale = 0.9
	elif global_position.y > original_pos.y:
		gravity_scale = -0.9

################################################################

var neighbors = []

func update_sort_direction():
	var with_fewer_cals = 0
	var with_more_cals = 0
	for n in neighbors:

		# TODO we only care if the mores are right of us or the fewers are left of us

		if n.global_position.x > global_position.x and n.total_calories > total_calories:
			with_more_cals += 1
		elif n.global_position.x < global_position.x and n.total_calories < total_calories:
			with_fewer_cals += 1

	if with_more_cals and with_more_cals > with_fewer_cals:
		move_dir = DIR.right
	elif with_fewer_cals and with_more_cals < with_fewer_cals:
		move_dir = DIR.left
	else:
		move_dir = DIR.stay

	apply_movement()

var speed = 50

func apply_movement():
	# move left or right based on size relative to neighbors
	var move_vec
	match move_dir:
		DIR.left: move_vec = Vector2(-1, 0) * speed
		DIR.right: move_vec = Vector2(1, 0) * speed
		# reverse the current movement
		DIR.stay: move_vec = linear_velocity * -1

	if move_vec:
		apply_impulse(Vector2.ZERO, move_vec)


func _on_DetectBox_area_entered(area:Area2D):
	if area == $HitBox:
		return

	if area.name == "HitBox":
		neighbors.append(area.get_parent())

	update_sort_direction()


func _on_DetectBox_area_exited(area:Area2D):
	if area == $HitBox:
		return

	if area.name == "HitBox":
		neighbors.erase(area.get_parent())

	update_sort_direction()
