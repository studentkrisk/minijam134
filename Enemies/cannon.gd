extends CharacterBody2D

var direction = Vector2.ZERO

func _turn():
	#global_position += direction * Global.tile_size * 2
	var tween = create_tween()
	tween.tween_property(self, "global_position", global_position + direction * Global.tile_size * 2, 0.1)
	tween.play()
