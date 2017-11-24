extends Node

var platform = preload("res://scenes/Platform.tscn")
var platformSpikes = preload("res://scenes/PlatformSpikes.tscn")
var platformBreak = preload("res://scenes/PlatformBreak.tscn")

export var numPlatforms = 200
export var levelWidth = 350
export var levelStart = 100
export var minY = 40
export var maxY = 50

var spawnPos = Vector2(300,800)
var platformInst
var prevWasTrap = false
var prevSpawnPos = Vector2(100,0)

func _ready():
	randomize()

	for x in range(0, 200):
		randPlatform()

func randPlatform():
	var platformType = rand_range(1, 10)
	
	if platformType < 2 and not prevWasTrap:
		platformInst = platformSpikes.instance()
		spawnTrap()
		
	elif platformType < 3 and not prevWasTrap:
		platformInst = platformBreak.instance()
		spawnTrap()

	else:
		platformInst = platform.instance()
		maxY = 50
		prevWasTrap = false
		spawnPos.x = rand_range(levelStart, levelWidth)
	
	spawnPos.y -= rand_range(minY, maxY)
	
	prevSpawnPos = spawnPos
	platformInst.set_pos(spawnPos)
	add_child(platformInst)

func spawnTrap():
	maxY = 30
	prevWasTrap = true #tells the game that the most recent platform was a trap
	var direction = round(rand_range(1,2)) #decides whether the trap will spawn to the left or right of the previous non trap platform
	
	if direction < 2:
		spawnPos.x = rand_range(levelStart, prevSpawnPos.x - 100)
	else:
		spawnPos.x = rand_range(prevSpawnPos.x + 100, levelWidth)
