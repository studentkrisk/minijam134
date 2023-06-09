extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var noise = FastNoiseLite.new()
	noise.fractal_type = FastNoiseLite.FRACTAL_NONE
	noise.seed = randi()
	for x in range(-5, 5):
		for y in range(-5, 5):
			if 0.5 < (noise.get_noise_2d(x*16, y*16)/2 + 0.5) - 0.05*(x*x + y*y):
				var i = $Icon.duplicate()
				i.position = Vector2(x, y)*Global.tile_size
				add_child(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
