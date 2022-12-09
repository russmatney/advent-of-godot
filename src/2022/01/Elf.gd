tool
extends KinematicBody2D

var inventory = []
var items = []
var total_calories = 0
var original_pos

enum DIR {stay, left, right}
var move_dir = DIR.stay

onready var anim = $AnimatedSprite
onready var item_container = $ItemContainer
onready var hitbox = $HitBox
onready var dir_label = $DirLabel

var total_green = Color(0.058824, 0.607843, 0.196078)

func _ready():
	if Engine.editor_hint:
		assign_inventory([1000, 2000])

	original_pos = global_position

##########################################################
# creating the inventory

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

func add_items():
	total_calories = 0
	for cals in inventory:
		# TODO add delay
		# add_item(cals)
		total_calories += cals

	add_item(total_calories, total_green)

var item_scene = preload("res://src/2022/01/Item.tscn")

func create_item(calories):
	var it = item_scene.instance()
	it.calories = calories
	return it

################################################################

func _process(_delta):
	pass

	# move towards original x position
	# if global_position.y < original_pos.y:
	# 	gravity_scale = 0.9
	# elif global_position.y > original_pos.y:
	# 	gravity_scale = -0.9

var velocity = Vector2.ZERO

var accel = 5000
var min_speed = 50
var max_speed = 200

func _physics_process(_delta):

	# move left or right based on size relative to neighbors
	match move_dir:
		DIR.left:
			velocity.x += -1 * accel
			velocity.x = clamp(velocity.x, -1 * min_speed, -1 * max_speed)
		DIR.right:
			velocity.x += accel
			velocity.x = clamp(velocity.x, min_speed, max_speed)
		DIR.stay:
			# TODO slow down first?
			velocity = Vector2.ZERO

	velocity = move_and_slide(velocity, Vector2.UP)

################################################################
# selecting and moving in a direction

# TODO maybe refactor away from impulses and instead do a 'swap' with a given neighbor?

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

	# apply_movement()
	update_color()
	update_ui()

func update_color():
	var new_color
	match move_dir:
		DIR.right: new_color = Color.crimson
		DIR.left: new_color = Color.aliceblue
		DIR.stay: new_color = Color.goldenrod

	if new_color:
		anim.modulate = new_color

func update_ui():
	var label
	match move_dir:
		DIR.right: label = "> right >"
		DIR.left: label = "< left <"
		DIR.stay: label = "| stay |"

	dir_label.bbcode_text = str("[center]", label)


################################################################
# detecting neighbors

var neighbors = []

func _on_DetectBox_area_entered(area:Area2D):
	if area == hitbox:
		return

	if area.name == "HitBox":
		neighbors.append(area.get_parent())

	update_sort_direction()


func _on_DetectBox_area_exited(area:Area2D):
	if area == hitbox:
		return

	if area.name == "HitBox":
		neighbors.erase(area.get_parent())

	update_sort_direction()
