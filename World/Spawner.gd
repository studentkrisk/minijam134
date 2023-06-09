extends Node2D

@onready var Pirate = preload("res://Enemies/Pirates.tscn")

@export var chance = 30

var rng = RandomNumberGenerator.new()

func _turn():
	var children = get_children()
	for i in children:
		i._turn()
	var num = rng.randi_range(0, chance)
	if num == 1:
		var pirate = Pirate.instantiate()
		var player = get_parent().player
		var offset = Vector2.ZERO
		num = rng.randi_range(0, 1)
		if(num == 1):
			num = rng.randi_range(0, 240)
			num = num + Global.tile_size/2 - (num + Global.tile_size/2)%Global.tile_size
			offset = Vector2(256, num)
		else:
			num = rng.randi_range(0, 240)
			num = num + Global.tile_size/2 - (num + Global.tile_size/2)%Global.tile_size
			offset = Vector2(-256, num)
		pirate.global_position = player.global_position + offset
		add_child(pirate)
