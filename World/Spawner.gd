extends Node2D

@onready var Pirate = preload("res://Enemies/Pirates.tscn")
@onready var Tentacle = preload("res://Enemies/tentacle.tscn")

@export var chanceP = 50
@export var chanceT = 3

var rng = RandomNumberGenerator.new()

func _turn():
	var children = get_children()
	for i in children:
		i._turn()
	var num = rng.randi_range(0, chanceP)
	if num == 1:
		var pirate = Pirate.instantiate()
		var player = Global.player
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
		pirate.global_position = Global.player.global_position + offset
		add_child(pirate)
	
	num = rng.randi_range(0, chanceT)
	if num == 1:
		var tentacle = Tentacle.instantiate()
		var player = Global.player
		var offset = Vector2.ZERO
		num = rng.randi_range(0, 3)
		if(num == 0):
			offset = Vector2(rng.randi_range(0, 8) * 32, rng.randi_range(0, 7) * 32)
		elif(num == 1):
			offset = Vector2(-rng.randi_range(0, 8) * 32, rng.randi_range(0, 7) * 32)
		elif(num == 2):
			offset = Vector2(rng.randi_range(0, 8) * 32, -rng.randi_range(0, 7) * 32)
		elif(num == 3):
			offset = Vector2(-rng.randi_range(0, 8) * 32, -rng.randi_range(0, 7) * 32)
		tentacle.global_position = player.global_position + offset
		#tentacle.global_position += Vector2(16, 16)
		#tentacle.global_position.y =  tentacle.global_position.y - fposmod(tentacle.global_position.y, 32)
		#tentacle.global_position.x =  tentacle.global_position.x - fposmod(tentacle.global_position.x, 32)
		if(tentacle.global_position.distance_to(player.global_position) >= 91):
			add_child(tentacle)
