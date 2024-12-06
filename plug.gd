extends "res://addons/gd-plug/plug.gd"

func _plugging():
	plug("MikeSchulze/gdUnit4", {include=["addons/gdUnit4"]})
	plug("russmatney/log.gd", {include=["addons/log"]})
