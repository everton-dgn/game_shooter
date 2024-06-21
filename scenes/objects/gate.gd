extends StaticBody2D


signal player_entered_gate(body)
signal player_exited_gate(body)


func _on_area_2d_body_entered(body) -> void:
	player_entered_gate.emit(body)


func _on_area_2d_body_exited(body) -> void:
	player_exited_gate.emit(body)
