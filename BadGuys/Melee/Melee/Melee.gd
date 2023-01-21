extends Enemy
class_name Melee
var moveSpeed = 10
var attackDistance = 20

var canAttack := true
export var stopMove := false

var warning = preload("res://BadGuys/Melee/Melee/warning.tscn")

var rng = RandomNumberGenerator.new()
var spawnDistance = 210
func _ready():
	rng.randomize()
	var angle=rng.randf()*2*PI 
	var position := Vector2(spawnDistance*cos(angle),spawnDistance*sin(angle))
	global_position = position


func _physics_process(delta):
	if(!stopMove):
		rotation = (player.global_position - global_position).normalized().angle()
		if(global_position.distance_to(player.global_position) < attackDistance):
			if(canAttack):
				attack()
				$CooldownTimer.start()
				canAttack = false
		else:
			var direction = (player.global_position - global_position).normalized()
			global_position+= direction * moveSpeed * delta

func attack():
	$AttackAnimation.play("Attack")
	pass

func warn():
	var newWarn = warning.instance()
	newWarn.position = global_position
	newWarn.rotation = 0
	newWarn.position[1] -= 30
	get_parent().add_child(newWarn)
	
func _on_CooldownTimer_timeout():
	canAttack = true
	pass # Replace with function body.

func _on_AttackHitbox_area_entered(area):
	area.getHurt(damage)
