extends Ranged


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var arrow = preload("res://BadGuys/Ranged/Stomp/Blast.tscn")

func _init():
	attackSpeed = 4
	hp = 10
	spawnCost = 2
	damage = 1
	bulletSpeed = 50
	scorePoints = 2500

func shoot(direction : Vector2):	
	createBullet(deg2Vec(0))
	createBullet(deg2Vec(45))
	createBullet(deg2Vec(90))
	createBullet(deg2Vec(135))
	createBullet(deg2Vec(180))
	createBullet(deg2Vec(225))
	createBullet(deg2Vec(270))
	createBullet(deg2Vec(315))

func createBullet(setD : Vector2):
	var newArrow = arrow.instance()
	newArrow.direction = setD
	newArrow.speed = bulletSpeed
	newArrow.global_position = global_position
	newArrow.damage =damage
	get_parent().add_child(newArrow)

func deg2Vec(deg):
	return Vector2(cos(deg2rad(deg)),sin(deg2rad(deg)))
