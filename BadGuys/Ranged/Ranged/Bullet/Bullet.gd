extends Node2D

var direction : Vector2
var speed : float
var damage : int

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
	queue_free()
	pass # Replace with function body.
