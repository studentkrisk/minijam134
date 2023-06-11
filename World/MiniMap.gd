extends ColorRect

var island = Sprite2D.new()
var island_sprite = preload("res://Art/islandmini.png")
var arrow_sprite = preload("res://Art/CannonBall.png")
var generated_sprites = false
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not generated_sprites and len(Global.islands) == Global.num_islands:
		island.texture = island_sprite
		for i in Global.islands:
			var copy = island.duplicate()
			add_child(copy)
			generated_sprites = true
	var children = get_children()
	children.erase($Player)
	for i in range(len(children)):
		children[i].position = size*((Global.islands[i].position + Global.islands[i].port_pos - Global.player.position)/(Vector2(32, 32)*16)/2 + Vector2(0.5, 0.5))
		if children[i].position.distance_to($Player.position) > 50:
			children[i].texture = arrow_sprite
			var a = children[i].position.angle()
			children[i].position = Vector2(
				clamp(-1, 1/tan(a), 1)*sign(sin(a)),
				clamp(-1, tan(a), 1)*sign(cos(a))
			)
			children[i].position = children[i].position*0.5 + Vector2.ONE*0.5
			children[i].position *= size.x
		else:
			children[i].texture = island_sprite
