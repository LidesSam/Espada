extends CanvasLayer

var on=false
var next=null
var last=null

func change_scene_to_file(target)->void:
	$anim.play("fill_up")
	on=true
	if(next):
		last=next
	next=target
	Global.detach_player()

func _on_anim_animation_finished(anim_name):
	if(on):
		on=false
		get_tree().change_scene_to_file(next)
		$anim.play_backwards(anim_name)

func play_intro_anim(anim_name):
	$anim.play_backwards(anim_name)
	
