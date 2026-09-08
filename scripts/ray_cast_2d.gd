extends RayCast2D
@onready var area_2d: Area2D = $"../Area2D"

@onready var sprite_2d: Sprite2D = $"../Area2D/Sprite2D"
@onready var line_2d: Line2D = $Line2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("fart"):
		enabled = true
		line_2d.visible = true 
		var fart = get_collider()
		if fart is Evil_meteor:
			fart.health -= 90 * delta
			if fart.health <= 0:
				fart.queue_free()

		
	if Input.is_action_just_released("fart"):
		enabled = false
		line_2d.visible = false
		
	
	
	if is_colliding():
		line_2d.set_point_position(1, to_local(get_collision_point()))
	else:
		line_2d.set_point_position(1, target_position)
	var mouse_pos = get_global_mouse_position()
	var target_angle = global_position.angle_to_point(mouse_pos)
	global_rotation = rotate_toward(global_rotation, target_angle , 5 * delta)
