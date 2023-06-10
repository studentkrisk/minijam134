extends CharacterBody2D

var moving = false

signal turn_end

func _physics_process(delta):
	$AnimationTree.active = !$AnimationTree.active
	if not $Raycast2D.is_colliding():
		global_position += $Raycast2D.target_position
		#var tween = create_tween()
		#tween.tween_property(self, "global_position", global_position + $Raycast2D.target_position, 0.1)
		#tween.play()
		#if moving:
			#$Wait.start(0.1)
			#moving = false
	moving = false
	
	for i in Global.islands:
		if i.port_pos + i.position + Vector2.ONE*0.5*Global.tile_size == position + $Raycast2D.target_position:
			print("interact! able to")
	
	var inp = Vector2(
		-int(Input.is_action_just_pressed("game_left")) + int(Input.is_action_just_pressed("game_right")),
		-int(Input.is_action_just_pressed("game_up")) + int(Input.is_action_just_pressed("game_down"))
	)
	
	if(inp != Vector2.ZERO):
		$AnimationTree.set("parameters/blend_position", inp)
	
	if(inp != Vector2.ZERO):
		moving = true
		emit_signal("turn_end")
	$Raycast2D.target_position = inp * Global.tile_size

func _on_hurtbox_body_entered(body):
	print("hit")
	body.queue_free()

func _on_wait_timeout():
	emit_signal("turn_end")

func _on_hurtbox_area_entered(area):
	print("hitT")
	area.get_parent().queue_free()
