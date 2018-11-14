extends Control

var list = []

#note to self
#investigate bug
#without minimum size being set, control shrinks to parent control

func _ready():
	pass # Replace with function body.

func append_agent(agent):
	list.append(agent)
	var visual = load("res://ServerShowcard.tscn").instance()
	visual.rect_position = Vector2(0,(100+5)* (list.size()-1))
	visual.connect("pressed",self,"enter_server",[agent])
	add_child(visual)

func enter_server(agent):
	pass