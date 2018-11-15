extends Control

var direction

enum {NONE, LEFT, UP, RIGHT, DOWN}

func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_pressed("ui_up"):
		Global.direction = UP
	elif Input.is_action_pressed("ui_down"):
		Global.direction = DOWN
	elif Input.is_action_pressed("ui_left"):
		Global.direction = LEFT
	elif Input.is_action_pressed("ui_right"):
		Global.direction = RIGHT
	else:
		Global.direction = NONE

	if Input.is_action_just_pressed("attack"):
		match Global.direction:
			NONE:
				pass
			LEFT, RIGHT:
				pass
			UP:
				pass
			DOWN:
				pass
	if Input.is_action_just_pressed("special"):
		match Global.direction:
			NONE:
				pass
			LEFT, RIGHT:
				pass
			UP:
				pass
			DOWN:
				pass
	if Input.is_action_just_pressed("block"):
		match Global.direction:
			NONE:
				pass
			LEFT, RIGHT:
				pass
			UP:
				pass
			DOWN:
				pass