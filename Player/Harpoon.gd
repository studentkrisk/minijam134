extends Node2D

@export var starting = Vector2.ZERO
@export var ending = Vector2.ZERO

var lifetime = 50
var player = null

func initialize():
	#ending += Vector2(16, 16)
	ending -= get_global_mouse_position()
	ending.x -= fmod(ending.x, 32)
	ending.y -= fmod(ending.y, 32)
	ending.x += 16
	ending.y += 16
	if(ending.distance_to(player.global_position) <= 91):
		$Line2D.points = [starting, ending]
		$Hitbox.global_position = ending
		$Hitbox/CollisionShape2D.disabled = false
	else:
		queue_free()

func _process(delta):
	if(lifetime <= 40):
		pass
		#$Hitbox/CollisionShape2D.disabled = true
	lifetime -= 1
	if(lifetime <= 0):
		queue_free()
