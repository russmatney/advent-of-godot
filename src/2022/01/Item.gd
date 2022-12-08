tool
extends Node2D

onready var label = $ColorRect/Label
var calories = 0

func _ready():
	if calories and label:
		label.bbcode_text = str("[center]", calories, "[/center]")

func update_background_color(color):
	$ColorRect.color = color
