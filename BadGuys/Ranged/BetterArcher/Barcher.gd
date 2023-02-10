extends Ranged



var arrow = preload("res://BadGuys/Ranged/BetterArcher/Shotgun.tscn")

func _init():
	attackSpeed = 1
	hp = 2
	spawnCost = 5
	damage = 1
	bulletSpeed = 50
	scorePoints = 5000

func shoot(direction : Vector2):
	createBullet(direction)
	var shootAngle = rad2deg(direction.angle())
	
	createBullet(deg2Vec(shootAngle+15))
	createBullet(deg2Vec(shootAngle-15))
	
func createBullet(setD : Vector2):
	var newArrow = arrow.instance()
	newArrow.direction = setD
	newArrow.speed = bulletSpeed
	newArrow.global_position = global_position
	newArrow.damage =damage
	get_parent().add_child(newArrow)

func deg2Vec(deg):
	return Vector2(cos(deg2rad(deg)),sin(deg2rad(deg)))
