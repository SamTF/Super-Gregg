extends Control

onready var textScore = get_node("Score")
onready var textHighscore = get_node("Highscore")

func setScore(score): #sets the current score on the game over screen
	textScore.set_text("Score: " + str(score))
	if score > Game.highscore: #checks if the current score is bigger than the highscore
		Game.highscore = score #if so, the current score becomes the new highscore
	
	textHighscore.set_text("Highscore: " + str(Game.highscore))
	