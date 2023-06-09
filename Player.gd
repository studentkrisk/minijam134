extends CharacterBody2D

var tile_size = 16

func _physics_process(delta):
	if not $Raycast2D.is_colliding():
		global_position += $Raycast2D.target_position
	
	var inp = Vector2(
		-int(Input.is_action_just_pressed("game_left")) + int(Input.is_action_just_pressed("game_right")),
		-int(Input.is_action_just_pressed("game_up")) + int(Input.is_action_just_pressed("game_down"))
	)
	
	$Raycast2D.target_position = inp * tile_size
