extends Enemy

class_name Ranged
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var bulletSpeed
export var spawnDistance = 210

func _ready():
	rng.randomize()
	var newPos = Vector2(10000,10000) 
	while(newPos.distance_to(Vector2.ZERO)>210):
		newPos = Vector2(rng.randf_range(-210,210), rng.randf_range(-210,210))
	
	global_position = newPos
	
func shoot(_direction : Vector2):
	print("lmao c'est ranged")

func _on_CooldownTimer_timeout():
	if(is_instance_valid(player)):
		var direction := (player.global_position - global_position).normalized()
		shoot(direction)
	pass # Replace with function body.
