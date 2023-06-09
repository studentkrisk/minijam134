extends Node2D

var player

func _ready():
	player = $Player
	$Player.turn_end.connect(_turn_end)
	
func _turn_end():
	print("yes")
	$Enemies._turn()
