extends AnimatableBody2D

var lifetime = 50

func _process(delta):
	
	global_position.y -= fmod(global_position.y, 32)
	
	#var vec = (get_global_mouse_position() - global_position + Vector2(0, 16))
	#if(vec.x * vec.x + vec.y * vec.y < 16*16):
	#	$Telegraph.visible = true
	#else:
	#	$Telegraph.visible = false

func _turn():
	if $Hitbox/CollisionShape2D.disabled:
		$Hitbox/CollisionShape2D.disabled = false
	else:
		lifetime -= 1
		if lifetime <= 0:
			queue_free()

func _on_island_check_area_entered(area):
	queue_free()

func _on_island_check_body_entered(body):
	queue_free()

func _on_hurtbox_area_entered(area):
	Global.tentaclesKilled += 1
	queue_free()
