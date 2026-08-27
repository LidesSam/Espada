extends Node3D


var text = "test dialog"


func on_interaction_range(display=true):
	if(display):
		show()
	else:
		hide()
