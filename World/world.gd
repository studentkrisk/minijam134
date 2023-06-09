extends Node2D

@onready var tileset = preload("res://Art/test_tile_set.tres")
var noise = FastNoiseLite.new()
var player

func _ready():
	player = $Player
	$Player.turn_end.connect(_turn_end)
	generate_islands(1)
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	
func _turn_end():
	$Enemies._turn()

func generate_islands(n):
	for i in range(n):
		for x in range(-5, 5):
			for y in range(-5, 5):
				if noise.get_noise_2d(x, y) > 0.3 + 0.4 * dist_squared(x, y):
					$Islands/TileMap.set_cell(0, Vector2i(x, y))
		
func dist_squared(x, y):
	var dx = 2 * x / 10 - 1
	var dy = 2 * y / 10 - 1
	return dx*dx + dy*dy
