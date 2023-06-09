extends Node2D

func _ready():
	$Player.turn_end.connect(_turn_end)
	
func _turn_end():
	print("yes")
