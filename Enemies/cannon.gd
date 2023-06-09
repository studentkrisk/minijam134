extends CharacterBody2D
class_name Cannon

var direction = Vector2.ZERO
var bullet_time = 0

func _turn():
	#global_position += direction * Global.tile_size * 2
	bullet_time += 1
	if(bullet_time == 2):
		var tween = create_tween()
		tween.tween_property(self, "global_position", global_position + direction * Global.tile_size * 2, 0.1)
		tween.play()
		bullet_time = 0
