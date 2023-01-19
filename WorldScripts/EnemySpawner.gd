extends Node2D

export var spawnPoints := 5
export var pointIncrease := 2
var enemies : Array = [preload("res://BadGuys/Ranged/Archer/Archer.tscn")] 

onready var enemyCost = fillCost()

func fillCost() -> Array:
	var costs:=[] 
	for enemy in enemies:
		var inst = enemy.instance()
		costs.append(inst.spawnCost)
	return costs

var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()



func _on_SpawnTimer_timeout():
	spawnWave()
	spawnPoints+=pointIncrease
	pass # Replace with function body.

func spawnWave():
	var pointsLeft = spawnPoints
	var i = 0
	while(pointsLeft > 0):
		i = rng.randi_range(0,enemies.size()-1)
		if(enemyCost[i]<=pointsLeft):
			var newEnemy = enemies[i].instance()
			add_child(newEnemy)
			pointsLeft-=enemyCost[i]
	pass
