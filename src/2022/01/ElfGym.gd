tool
extends Node2D


func _ready():
	$Elf.assign_inventory([1000, 2000, 3000])
	$Elf2.assign_inventory([4000])
	$Elf3.assign_inventory([10000])
