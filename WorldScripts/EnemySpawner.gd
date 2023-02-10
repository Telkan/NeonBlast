extends Node2D

export var spawnPoints := 5
export var pointIncrease := 2
var enemies : Array = [preload("res://BadGuys/Ranged/Archer/Archer.tscn"),preload("res://BadGuys/Ranged/BetterArcher/Barcher.tscn"),preload("res://BadGuys/Ranged/Stomp/Stomp.tscn")] 

onready var enemyCost = fillCost()
var player

func fillCost() -> Array:
	var costs:=[] 
	for enemy in enemies:
		var inst = enemy.instance()
		costs.append(inst.spawnCost)
	return costs

var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()
	player = get_tree().get_nodes_in_group("Player")[0]



func _on_SpawnTimer_timeout():
	if(is_instance_valid(player)):
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
