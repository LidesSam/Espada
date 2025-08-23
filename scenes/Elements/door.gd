extends Area3D


@export var targetScene ="res://scenes/world/EntradaIlumiada.tscn"
@export var actorsParentNode:Node3D =null 
@onready var spawnPoint=$spawn

func _ready() -> void:
	print("aloha door")
	
	print("scr:door:last:",ScreenTransition.last,":tscene:",targetScene,":/:",ScreenTransition.last==targetScene )
	if targetScene==ScreenTransition.last:
		print(get_tree().current_scene.scene_file_path)
		
		print("door:adding player to parent node:",Global.player, ":",actorsParentNode)
		
		if(Global.player and actorsParentNode!=null):
			print("door:adding player to parent node")
			Global.player.global_position = $spawn.global_position
			actorsParentNode.add_child(Global.player)
			#$CollisionShape3D.disabled=true
				

func _on_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if(body.is_in_group("player")):
		ScreenTransition.change_scene_to_file(targetScene)
