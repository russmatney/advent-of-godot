tool
extends Node2D


func elf_inventories(f = "input.txt"):
	f = str("res://src/2022/01/", f)
	print(f)
	return f

func _ready():
	elf_inventories("example.txt")
