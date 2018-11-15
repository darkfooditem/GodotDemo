extends Node

var player = 1
var enemy = 2
enum {NONE, LEFT, UP, RIGHT, DOWN}
var direction
var not_testing = true


func _ready():
	pass # Replace with function body.

func start_game(final = not_testing):
	if !final:
		rpc_id(enemy,"start_game", true)
	var root = get_tree().get_root()
	root.get_child(root.get_child_count()-1).queue_free()
	var game = load("res://Main.tscn").instance()
	root.call_deferred("add_child",game)
	if player == 1:
	#if true:
		print("doing it")
		game.initialize_player(str(player))
		
		game.initialize_player(str(enemy))


