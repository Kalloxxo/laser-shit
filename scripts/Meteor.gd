extends Area2D
class_name Evil_meteor
var rotation_speed = 1
var health = 100
var reward = randi_range(1, 10)

func _process(delta: float) -> void:
	rotation += rotation_speed * delta
