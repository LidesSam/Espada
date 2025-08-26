extends ColorRect

var file = null

func _ready():

	self_modulate = "#150803"
	
	
func set_file(fileCode:int=0):
	$label.text = str("file-",fileCode)
	self_modulate = "#21142f"
	pass
	
func delete_file():
	pass
	
func save_on_file():
	pass
