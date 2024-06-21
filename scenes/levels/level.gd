extends Node2D


var laser_scene: PackedScene = preload('res://scenes/projectiles/laser.tscn')
var grenade_scene: PackedScene = preload('res://scenes/projectiles/grenade.tscn')


func _on_gate_player_entered_gate(body):
	print('player has entered gate')
	print(body)


func _on_gate_player_exited_gate(body):
	print('player has exited gate')
	print(body)


func _on_player_laser_fired(pos, direction):
	var laser: Area2D = laser_scene.instantiate()
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.call_deferred('add_child', laser)


func _on_player_grenade_fired(pos, direction):
	var grenade: RigidBody2D = grenade_scene.instantiate()
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.call_deferred('add_child', grenade)
