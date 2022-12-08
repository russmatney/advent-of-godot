tool
extends RigidBody2D

var inventory = []
var items = []

func _ready():
	if Engine.editor_hint:
		assign_inventory([1000, 2000])

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
	var total_cals = 0
	for cals in inventory:
		# TODO add delay
		add_item(cals)
		total_cals += cals

	add_item(total_cals, total_green)

var item_scene = preload("res://src/2022/01/Item.tscn")

func create_item(calories):
	var it = item_scene.instance()
	it.calories = calories
	return it
