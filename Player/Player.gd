extends KinematicBody2D

var speed = 100  # speed in pixels/sec
var velocity = Vector2.ZERO
export var hp = 5
var isInvincible := false

var shieldAmount := 1.0
var shieldChargeSpeed = 0.1
var shieldDischargeSpeed = 1
var blasterCount := 0
var shielding := false
var bullet = preload("res://BadGuys/Ranged/Archer/Arrow.tscn")
var dedPart = preload("res://Player/PlayerDeath.tscn")

func get_input():
	
	velocity = Vector2.ZERO
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	# Make sure diagonal movement isn't faster
	velocity = velocity.normalized() * speed
	

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	$Sprite.set_rotation(get_global_mouse_position().angle_to_point(global_position))
	
	if !shielding:
		if Input.is_action_pressed("absorb"):
			shielding=true
			$Shield.set_visible(true)
			$Shield/ShieldAbsorb.monitorable = true
			$Shield/ShieldAbsorb.monitoring = true
		if Input.is_action_just_pressed("shoot"):
			if(blasterCount>0):
				blasterCount-=1
				var newBullet = bullet.instance()
				newBullet.speed = 200
				newBullet.direction = (get_global_mouse_position() - global_position).normalized()
				newBullet.position = global_position
				newBullet.damage = 1
				get_parent().add_child(newBullet)
				$CanvasLayer/AmmoBar.value = blasterCount
				
	if(shielding):
		shieldAmount-=shieldDischargeSpeed*_delta
		if shieldAmount<=0:
			shieldAmount = 0
			shielding = false
			$Shield.set_visible(false)
			$Shield/ShieldAbsorb.monitorable = false
			$Shield/ShieldAbsorb.monitoring = false
	else:
		shieldAmount+=shieldChargeSpeed*_delta
		if shieldAmount>=1:
			shieldAmount=1
	$CanvasLayer/ShieldBar.value = shieldAmount

func getHurt(dmg):
	if !isInvincible:
		hp-=dmg
		isInvincible = true
		$InvincibilityTimer.start()
		$AnimationPlayer.play("Flash")
		$HurtSound.playHurt()
		if(hp <= 0):
			var newdedPart= dedPart.instance()
			newdedPart.position = global_position
			get_parent().add_child(newdedPart)
			queue_free()
		$CanvasLayer/HealthBar.value = hp

func _on_InvincibilityTimer_timeout():
	isInvincible = false
	pass # Replace with function body.


func _on_ShieldAbsorb_area_entered(area):
	area.die()
	blasterCount+=1
	$CanvasLayer/AmmoBar.value = blasterCount
	if(blasterCount>40):
		blasterCount=40
