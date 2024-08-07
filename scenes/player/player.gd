extends CharacterBody2D


signal laser_fired(pos, direction)
signal grenade_fired(pos, direction)


var can_laser := true
var can_grenade := true


@export var max_speed: int = 500
var speed: int = max_speed


func _process(_delta):
	var direction := Input.get_vector('Left', 'Right', 'Up', 'Down')
	velocity = direction * speed
	move_and_slide()

	look_at(get_global_mouse_position())

	var player_direction := (get_global_mouse_position() - position).normalized()

	if Input.is_action_pressed('Primary Action') and can_laser:
		$GPUParticles2D.emitting = true
		var laser_markers := $LaserStartPositions.get_children()
		var selected_laser := laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$LaserReloadTimer.start()
		laser_fired.emit(selected_laser.global_position, player_direction)

	if Input.is_action_pressed('Secondary Action') and can_grenade:
		can_grenade = false
		$GrenadeReloadTimer.start()
		var pos = $LaserStartPositions.get_children()[0].global_position
		grenade_fired.emit(pos, player_direction)


func _on_laser_reload_timer_timeout() -> void:
	can_laser = true


func _on_grenade_reload_timer_timeout() -> void:
	can_grenade = true
