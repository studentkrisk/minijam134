extends CharacterBody2D

var player = null

func _turn():
	if player != null:
		var inp = Vector2.ZERO
		if(abs(player.global_position.y - global_position.y) < abs(player.global_position.x - global_position.x)):
			if(player.global_position.y < global_position.y):
				inp = Vector2(0, -1)
			else:
				inp = Vector2(0, 1)
		else:
			if(player.global_position.x < global_position.x):
				inp = Vector2(-1, 0)
			else:
				inp = Vector2(1, 0)
		$Raycast2D.target_position = inp * Global.tile_size
		if not $Raycast2D.is_colliding():
			global_position += $Raycast2D.target_position

func _on_player_detection_zone_body_entered(body):
	player = body
