extends Control

var direction

enum {NONE, LEFT, UP, RIGHT, DOWN}

func _ready():
	#initialize_player("1");
	
	pass # Replace with function body.

remote func initialize_player(name, final = Global.not_testing):
	var player = load("res://Player.tscn").instance()
	player.name = name
	$World.add_child(player)
	if player.name == str(Global.player) :
		player.get_node("Player").active_player = true
	if !final:
		rpc_id(Global.enemy, "initialize_player", name, true)


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