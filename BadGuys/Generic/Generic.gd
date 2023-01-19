extends Node2D

class_name Enemy

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var attackSpeed : float
var hp : int
var spawnCost : int
var damage : int
var player : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	$CooldownTimer.set_wait_time(attackSpeed)
	$CooldownTimer.start()
	pass # Replace with function body.


func getHurt(dmg:int):
	hp-=dmg
	if (hp<=0):
		die()
	else:
		hit(dmg) #hit feedback
		
func die():
	queue_free()

func hit(_dmg):
	$AnimationPlayer.play("Hurt")
	pass
