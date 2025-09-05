extends Node3D

func _ready() -> void:
	if !Global.player:
		var player =load("res://scenes/Elements/Illusia.tscn").instantiate()
		player.global_position= $droppoint.global_position
		$actors.add_child(player)
		Global.player=player
