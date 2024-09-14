extends Node3D

@onready var spawnTimer:=$Timer
var enemyPreload:=preload("res://Cel.tscn")

var nextSpawnTime:=2.5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	spawnTimer.start(nextSpawnTime)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var enemy=enemyPreload.instantiate()
	enemy.position=Vector3(randi()%7,1+randi()%6,7-randi()%5)
	get_tree().current_scene.add_child(enemy)
	
	spawnTimer.start(nextSpawnTime)
