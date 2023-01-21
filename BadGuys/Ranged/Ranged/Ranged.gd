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
	var angle=rng.randf()*2*PI 
	var position := Vector2(spawnDistance*cos(angle),spawnDistance*sin(angle))
	global_position = position
	
func shoot(_direction : Vector2):
	print("lmao c'est ranged")

func _on_CooldownTimer_timeout():
	var direction := (player.global_position - global_position).normalized()
	shoot(direction)
	pass # Replace with function body.
