extends AnimatableBody2D

var lifetime = 5

func _process(delta):
	var vec = (get_global_mouse_position() - global_position)
	if(vec.x * vec.x + vec.y * vec.y < 16*16):
		$Telegraph.visible = true
	else:
		$Telegraph.visible = false

func _turn():
	if $Hitbox/CollisionShape2D.disabled:
		$Hitbox/CollisionShape2D.disabled = false
	else:
		lifetime -= 1
		if lifetime <= 0:
			queue_free()
