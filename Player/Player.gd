extends CharacterBody2D

var tile_size = 16
var moving = false

signal turn_end

func _physics_process(delta):
	if not $Raycast2D.is_colliding():
		global_position += $Raycast2D.target_position
		if moving:
			emit_signal("turn_end")
			moving = false
	moving = false
	
	var inp = Vector2(
		-int(Input.is_action_just_pressed("game_left")) + int(Input.is_action_just_pressed("game_right")),
		-int(Input.is_action_just_pressed("game_up")) + int(Input.is_action_just_pressed("game_down"))
	)
	
	if(inp != Vector2.ZERO):
		moving = true
	$Raycast2D.target_position = inp * tile_size
