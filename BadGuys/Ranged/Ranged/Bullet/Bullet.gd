extends Node2D

var direction : Vector2
var speed : float
var damage : int
var deathPart = preload("res://BadGuys/Ranged/Ranged/Bullet/DeathParticles.tscn")
func _ready():
	$Sprite.rotation = direction.angle()
	$Timer.start()

func _physics_process(delta):
	global_position += direction*speed * delta

func _on_HitSomething_area_entered(area):
	area.getHurt(damage)
	queue_free()

func _process(_delta):
	if global_position.distance_squared_to(Vector2(0,0)) > 400000:
		queue_free()

func _on_Timer_timeout():
	$HitSomething.set_collision_mask_bit(0,1)


func _on_HitSomething_body_entered(_body):
	var part = deathPart.instance()
	part.position = global_position
	part.rotation = $Sprite.rotation
	get_parent().add_child(part)
	queue_free()
	pass # Replace with function body.


