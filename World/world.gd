extends Node2D

@onready var Island = preload("res://Island.tscn")
func _ready():
	Global.player = $Player
	$Player.turn_end.connect(_turn_end)
	for n in range(Global.num_islands):
		var i = Island.instantiate()
		i.position = Vector2.ZERO
		while i.position.distance_to(Vector2.ZERO) < 10*Global.tile_size:
			i.position = Vector2(randi_range(-50, 50)*Global.tile_size, randi_range(-50, 50)*Global.tile_size)
		i.position = Vector2(randi_range(-50, 50)*Global.tile_size, randi_range(-50, 50)*Global.tile_size)
		Global.islands.append(i)
		$Islands.add_child(i)
func _turn_end():
	$Enemies._turn()
		
func dist_squared(x, y):
	var dx = 2 * x / 10 - 1
	var dy = 2 * y / 10 - 1
	return dx*dx + dy*dy
