extends Node


var player=null
var deathcount=0

func new_game():
	deathcount= null

func set_player(p):
	player= p
func detach_player():
	if player and player.get_parent():
		player.get_parent().remove_child(player)

func die():
	deathcount+=1
