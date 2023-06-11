extends Node2D

@onready var Island = preload("res://Island.tscn")
var generating = true
func _ready():
	Global.player = $Player
	$Player.turn_end.connect(_turn_end)
	for n in range(Global.num_islands):
		var i = Island.instantiate()
		i.position = Vector2.ZERO
		var area : Area2D = i.get_node("NoSpawnZone")
		while true:
			i.position = Vector2(randi_range(-50, 50)*Global.tile_size, randi_range(-50, 50)*Global.tile_size)
			var lowest_dist = 9999999
			for j in Global.islands:
				var dist = j.position.distance_to(i.position)
				if dist < lowest_dist:
					lowest_dist = dist
			if i.position.distance_to(Vector2.ZERO) > 10*Global.tile_size and lowest_dist > 10*Global.tile_size:
				break
		Global.islands.append(i)
		$Islands.add_child(i)
		
		
func _turn_end():
	$Enemies._turn()
		
func dist_squared(x, y):
	var dx = 2 * x / 10 - 1
	var dy = 2 * y / 10 - 1
	return dx*dx + dy*dy
