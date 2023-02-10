extends Ranged


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var arrow = preload("res://BadGuys/Ranged/Archer/Arrow.tscn")

func _init():
	attackSpeed = 2
	hp = 3
	spawnCost = 1
	damage = 1
	bulletSpeed = 200
	scorePoints = 1000

func shoot(direction : Vector2):
	var newArrow = arrow.instance()
	newArrow.direction = direction
	newArrow.speed = bulletSpeed
	newArrow.global_position = global_position
	newArrow.damage =damage
	get_parent().add_child(newArrow)

