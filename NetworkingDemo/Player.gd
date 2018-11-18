extends Node2D

var active_player = false
var moveable = true
var grounded = true
var speed = 200
var air_speed = 200 
var fall_speed = 200

func _ready():
	pass # Replace with function body.


remote func set_position(change, final = Global.not_testing):
	position = change
	if !final:
		rpc_id(Global.enemy, "set_position", change, true);

func translate(change):
	set_position(position + change)

func _process(delta):
	if active_player:
		if moveable:
			var change = Vector2( (-1 if Global.direction==Global.LEFT else (1 if Global.direction==Global.RIGHT else 0) ),0)
			#var change = Vector2(1,0)
			change *= (speed if grounded else air_speed) * delta
			change += Vector2(0, fall_speed ) * delta * (0 if grounded else -1)
			translate( change )
