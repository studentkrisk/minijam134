extends Node2D

@onready var Island = preload("res://World/Island.tscn")
var generating = true
var step = "move"

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
		
func _process(delta):
	if step == "move":
		$CanvasLayer/Label2.text = "Use WASD to move"
		$CanvasLayer/Label2.position.x = 256 - $CanvasLayer/Label2.size.x/2
		var inp = Vector2(
		-int(Input.is_action_just_pressed("game_left")) + int(Input.is_action_just_pressed("game_right")),
		-int(Input.is_action_just_pressed("game_up")) + int(Input.is_action_just_pressed("game_down"))
		)
		if (inp != Vector2.ZERO):
			step = "aim"
	if step == "aim":
		$CanvasLayer/Label.visible = true
		$CanvasLayer/Label.text = "The harpoon is innacurate"
		$CanvasLayer/Label.position.x = 256 - $CanvasLayer/Label.size.x/2
		$CanvasLayer/Label2.text = "So hold E to Aim"
		$CanvasLayer/Label2.position.x = 256 - $CanvasLayer/Label2.size.x/2
		if(Input.is_action_just_pressed("Aim")):
			step = "shoot"
	if step == "shoot":
		$CanvasLayer/Label.visible = true
		$CanvasLayer/Label.text = "Now left click to shoot"
		$CanvasLayer/Label.position.x = 256 - $CanvasLayer/Label.size.x/2
		$CanvasLayer/Label2.text = "(Only a 2 tile radius)"
		$CanvasLayer/Label2.position.x = 256 - $CanvasLayer/Label2.size.x/2
		if(Input.is_action_just_pressed("Shoot")):
			step = "kill"
	if step == "kill":
		$CanvasLayer/Label.visible = true
		$CanvasLayer/Label.text = "Now that you know how to kill"
		$CanvasLayer/Label.position.x = 256 - $CanvasLayer/Label.size.x/2
		$CanvasLayer/Label2.text = "try and kill a kraken tentacle"
		$CanvasLayer/Label2.position.x = 256 - $CanvasLayer/Label2.size.x/2
		
		
func _turn_end():
	$Enemies._turn()
		
func dist_squared(x, y):
	var dx = 2 * x / 10 - 1
	var dy = 2 * y / 10 - 1
	return dx*dx + dy*dy
