extends CharacterBody2D

var moving = false

signal turn_end

func _physics_process(delta):
	$AnimationTree.active = !$AnimationTree.active
	if not $Raycast2D.is_colliding():
		#global_position += $Raycast2D.target_position
		var tween = create_tween()
		tween.tween_property(self, "global_position", global_position + $Raycast2D.target_position, 0.01)
		tween.play()
		if moving:
			emit_signal("turn_end")
			moving = false
	moving = false
	
	if Input.is_action_just_pressed("wait"):
		emit_signal("turn_end")
	
	var inp = Vector2(
		-int(Input.is_action_just_pressed("game_left")) + int(Input.is_action_just_pressed("game_right")),
		-int(Input.is_action_just_pressed("game_up")) + int(Input.is_action_just_pressed("game_down"))
	)
	
	if(inp != Vector2.ZERO):
		$AnimationTree.set("parameters/blend_position", inp)
	
	if(inp != Vector2.ZERO):
		moving = true
	$Raycast2D.target_position = inp * Global.tile_size

func _on_hurtbox_body_entered(body):
	print("hit")
	body.queue_free()
