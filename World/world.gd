extends Node2D

@onready var Island = preload("res://Island.tscn")
var player

func _ready():
	player = $Player
	$Player.turn_end.connect(_turn_end)
	for n in range(10):
		var i = Island.instantiate()
		i.position = Vector2(n*16*15, 0)
		$Islands.add_child(i)
	
func _turn_end():
	$Enemies._turn()
		
func dist_squared(x, y):
	var dx = 2 * x / 10 - 1
	var dy = 2 * y / 10 - 1
	return dx*dx + dy*dy
