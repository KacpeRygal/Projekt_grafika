extends Node3D

const SENSITIVITY=0.01
var bullet =load("res://pocisk.tscn")
@onready var gunbarrel=$Glowa/Camera3D/pistolet/RayCast3D
@onready var head=$Glowa
@onready var camera=$Glowa/Camera3D

var timer=0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _physics_process(delta):
	if Input.is_action_pressed("shoot"):
		if timer>0.25:
			var instance=bullet.instantiate()
			instance.position=gunbarrel.global_position
			instance.transform.basis=gunbarrel.global_transform.basis
			get_parent().add_child(instance)
			timer=0
	timer+=delta

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x*SENSITIVITY)
		camera.rotate_x(-event.relative.y*SENSITIVITY)
		camera.rotation.x=clamp(camera.rotation.x,deg_to_rad(-40),deg_to_rad(60))
#func _input(event: InputEvent):
	#if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		#pass
		##shoot()
	##if Input.is_action_pressed("shoot"):
#
#
#
#func shoot():
	#var space_state = get_world_3d().direct_space_state
	#var mouse_position = get_viewport().get_mouse_position()
	#var from = $Kamera3D.project_ray_origin(mouse_position)
#
	#var to = from + $Kamera3D.project_ray_normal(mouse_position) * 1000
#
	## Utwórz parametry promienia
	#var ray_query = PhysicsRayQueryParameters3D.create(from, to)
#
	## Użyj nowej wersji intersect_ray z obiektem parametrów
	#var result = space_state.intersect_ray(ray_query)
#
	#if result and result.collider:
		## Jeśli trafiono cel, usuń go
		#result.collider.queue_free()
