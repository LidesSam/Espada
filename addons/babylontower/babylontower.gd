@tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("interactive","Node3D",preload("source/interactive.gd"),preload("assets/sprites/exclamation.png"))

func _exit_tree():
	remove_custom_type("Interactive")

#to draw this editor tab
func _has_main_screen():
	return true;
#TiTLe of the tab and plugin
func _get_plugin_name():
	return "BABYLON-TOWER"
	
func _get_plugin_icon():
	return preload("assets/sprites/exclamation.png")
