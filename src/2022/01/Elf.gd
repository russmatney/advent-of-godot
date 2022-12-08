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

func add_items():
	for item in inventory:
		var it = create_item(item)

		# TODO add delay
		# TODO increase y position per item
		$ItemContainer.add_child(it)

var item_scene = preload("res://src/2022/01/Item.tscn")

func create_item(calories):
	var it = item_scene.instance()
	it.calories = calories
	return it
