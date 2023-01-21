extends KinematicBody2D

var speed = 100  # speed in pixels/sec
var velocity = Vector2.ZERO
export var hp = 100
var isInvincible := false
var canDash := true

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

func getHurt(dmg):
	if !isInvincible:
		hp-=dmg
		isInvincible = true
		$InvincibilityTimer.start()
		$AnimationPlayer.play("Flash")
		$HurtSound.playHurt()
		if(hp <= 0):
			queue_free()
		$CanvasLayer/HealthBar.value = hp

func _on_InvincibilityTimer_timeout():
	isInvincible = false
	pass # Replace with function body.
