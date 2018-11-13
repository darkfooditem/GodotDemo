extends Control

var list = []


func _ready():
	pass # Replace with function body.

func append_agent(agent):
	list.append(agent)
	var visual = load("res://ServerShowcard.tscn").instance()
	visual.rect_position = Vector2(0,(visual.rect_size.y+5)* list.size())
	visual.connect("pressed",self,"enter_server",[agent])
	add_child(visual)

func enter_server(agent):
	pass