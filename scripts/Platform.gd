extends StaticBody2D

export var velocity = Vector2(0, -100)
onready var levelGenerator = utils.main_node.get_node("LevelGenerator")

onready var anim = utils.main_node.get_node("Player").get_node("Sprite")

func _on_Area2D_body_enter( body ):
	if body.is_in_group("Player") and body.pos < get_global_pos().y and not body.touchedSpikes: #triggers if the player came from above and hasn't touched spikes
		body.set_linear_velocity(velocity)
		levelGenerator.randPlatform()
		anim.play("default")
		anim.play("jump")
		print("boing")

func _on_exit_screen():
	queue_free()
