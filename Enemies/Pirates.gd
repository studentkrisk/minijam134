extends CharacterBody2D

var player = null

@onready var Cannon = preload("res://Enemies/cannon.tscn")

func _turn():
	if player != null:
		var inp = Vector2.ZERO
		if(abs(player.global_position.y - global_position.y) < abs(player.global_position.x - global_position.x)):
			if(player.global_position.y < global_position.y):
				inp = Vector2(0, -1)
			elif(player.global_position.y > global_position.y):
				inp = Vector2(0, 1)
			else:
				var dir = Vector2.ZERO
				if(player.global_position.x < global_position.x):
					dir = Vector2(-1, 0)
				else:
					dir = Vector2(1, 0)
				var cannon = Cannon.instantiate()
				cannon.global_position = global_position
				cannon.direction = dir
				get_parent().add_child(cannon)
		else:
			if(player.global_position.x < global_position.x):
				inp = Vector2(-1, 0)
			elif(player.global_position.x > global_position.x):
				inp = Vector2(1, 0)
			else:
				var dir = Vector2.ZERO
				if(player.global_position.y < global_position.y):
					dir = Vector2(0, -1)
				else:
					dir = Vector2(0, 1)
				var cannon = Cannon.instantiate()
				cannon.global_position = global_position
				cannon.direction = dir
				get_parent().add_child(cannon)
		$Raycast2D.target_position = inp * Global.tile_size
		if not $Raycast2D.is_colliding():
			global_position += $Raycast2D.target_position

func _on_player_detection_zone_body_entered(body):
	player = body
