extends Control
var NEWGAMEMODE= 0
var LOADMODE= 1

var mode = 0

func _ready() -> void:
	pass

func _on_new_game_btn_pressed() -> void:
	ScreenTransition.change_scene_to_file("res://scenes/world/EntradaIlumiada.tscn")
	pass # Replace with function body.


func _on_load_game_pressed() -> void:
	$main.hide()
	$load.show()
	pass # Replace with function body.


func _on_file_1_pressed() -> void:
	pass # Replace with function body.


func _on_file_2_pressed() -> void:
	pass # Replace with function body.
