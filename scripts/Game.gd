#This scripts saves and loads the highscore onto a file

extends Node

var highscore = 0 setget setHighscore
const filePath = "user://highscore.data"

func _ready():
	loadHishcore()

func loadHishcore():
	var file = File.new()
	if not file.file_exists(filePath): return
	file.open(filePath, File.READ)
	highscore = file.get_var()
	file.close()

func saveHighscore():
	var file = File.new()
	file.open(filePath, File.WRITE)
	file.store_var(highscore)
	file.close()

func setHighscore(newValue):
	highscore = newValue
	saveHighscore()