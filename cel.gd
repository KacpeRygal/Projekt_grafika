extends Node3D

@export var speed = 5.0
var direction = Vector3(1, 0, 0)


func _process(delta):
	# Porusz cel w wybranym kierunku
	translate(direction * speed * delta)
	# Zmień kierunek po dotarciu do określonej pozycji
	if position.x > 10 or position.x < -10:
		direction.x *= -1


func _on_area_3d_target_hit() -> void:
	queue_free()
