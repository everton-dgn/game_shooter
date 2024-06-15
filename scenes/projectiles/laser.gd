extends Area2D


@export var speed := 1000
var direction := Vector2.UP


func _process(delta):
	position += direction * speed * delta
