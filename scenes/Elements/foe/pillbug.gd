extends CharacterBody3D

var lp:int = 100
var maxlp:int = 100
@onready var fsm = $fsm

func _ready() -> void:
	fsm.autoload(self)
	
	fsm.addStateTransition("idle","rollback",is_in_ball)
	fsm.addStateTransition("rollback","idle",is_not_in_ball)

	
	fsm.addGlobalTransition("dead",is_dead)
	
	fsm.startState()
	
func _process(delta: float) -> void:
	fsm.fsmUpdate(delta)
	
func move_randomly():
	if($moveTimer.is_stopped()):
		$moveTimer.start()
		#change dir
		#rotate radomlu
		#apply force foward
		#negative acelartion
	
	move_and_slide()
	

func is_in_ball():
	return !$hitTimer.is_stopped()
	
func is_not_in_ball():
	return $hitTimer.is_stopped()	
func is_dead():
	return lp<=0
	
func hit(points:int=0, direction:Vector3=Vector3.BACK):
	lp-=points
	rollback(direction)
	
func rollback(direction:Vector3=Vector3.BACK):
	$hitTimer.start()
	
