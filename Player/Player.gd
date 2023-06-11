extends CharacterBody2D

var moving = false

signal turn_end

@onready var Harpoon = preload("res://Player/harpoon.tscn")

func _physics_process(delta):
	#var mag = pow(pow(get_global_mouse_position().x, 2) + pow(get_global_mouse_position().y, 2), 0.5)
	var mousePos = get_global_mouse_position()# + (Vector2(16 * get_global_mouse_position().x/100, 16 * get_global_mouse_position().y/100))
	
	$ColorRect.global_position = Vector2(mousePos.x - fmod(mousePos.x, 32), mousePos.y - fmod(mousePos.y, 32))
	
	if(($ColorRect.global_position + Vector2(16, 16)).distance_to(global_position) >= 91):
		$ColorRect.color = Color(255, 0, 0, 125)
	else:
		$ColorRect.color = Color(0, 255, 0, 125)
	
	if(Input.is_action_just_pressed("Aim")):
		$ColorRect.visible = true
	
	if(Input.is_action_just_released("Aim")):
		$ColorRect.visible = false
	
	if(Input.is_action_just_pressed("Shoot")):
		var harpoon = Harpoon.instantiate()
		harpoon.starting = global_position
		harpoon.ending = get_global_mouse_position()
		harpoon.player = self
		harpoon.initialize()
		get_tree().current_scene.add_child(harpoon)
		emit_signal("turn_end")
	
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
