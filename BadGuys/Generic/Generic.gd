extends Node2D

class_name Enemy

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dedPart = preload("res://BadGuys/Ranged/Ranged/BadGuyDeath.tscn")

var attackSpeed : float
var hp : int
var spawnCost : int
var damage : int
var player : Node2D
var scorePoints
# Called when the node enters the scene tree for the first time.
func _ready():

	player = get_tree().get_nodes_in_group("Player")[0]
	$CooldownTimer.set_wait_time(attackSpeed)
	$CooldownTimer.start()


func getHurt(dmg:int):
	hp-=dmg
	if (hp<=0):
		die()
	else:
		hit(dmg) #hit feedback
		$HealthBar.resizeHealth()
		
func die():
	var newdedPart= dedPart.instance()
	newdedPart.position = global_position
	get_parent().add_child(newdedPart)
	get_tree().get_nodes_in_group("Score")[0].addScore(scorePoints)
	queue_free()

func hit(_dmg):
	$AnimationPlayer.play("Hurt")
	pass
