extends Area2D

@export var speed_bonus := 1.5
@export var duration := 5.0
@export var lifetime := 5.0  # tempo até desaparecer

func _ready() -> void:
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Player":
		area.apply_speed_boost(speed_bonus, duration)
		queue_free()
