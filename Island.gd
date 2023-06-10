extends TileMap

@export var port_pos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	var noise = FastNoiseLite.new()
	noise.fractal_type = FastNoiseLite.FRACTAL_NONE
	noise.seed = randi()
	var cells = []
	for x in range(-5, 5):
		for y in range(-5, 5):
			if 0.4 < (noise.get_noise_2d(x*8, y*8)/2 + 0.5) - 0.025*(x*x + y*y):
				cells.append(Vector2i(x, y))
				if Vector2.ZERO.distance_to(port_pos) < Vector2.ZERO.distance_to(Vector2(x, y)):
					port_pos = Vector2(x, y)*Global.tile_size
	set_cells_terrain_connect(0, cells, 0, 0)
	$Icon.position = port_pos
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
