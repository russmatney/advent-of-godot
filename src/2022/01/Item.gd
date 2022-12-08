tool
extends RigidBody2D

onready var label = $ColorRect/Label
var calories = 0

func _ready():
	if calories and label:
		label.bbcode_text = str("[center]", calories, "[/center]")
	elif calories:
		print("[WARN]: no %Label found?")
