extends Area2D
@export var lifetime := 10.0  # tempo até desaparecer

func _ready() -> void:
	await get_tree().create_timer(lifetime).timeout
	queue_free()
	
func _on_area_entered(area: Area2D) -> void:
	if area.name == "Player":
		explode()

func explode():
	# elimina todos os inimigos
	var enemies = get_tree().get_nodes_in_group("enemy")
	for e in enemies:
		e.queue_free()

	# som de explosão (se tiver)
	if has_node("AudioStreamPlayer2D"):
		$AudioStreamPlayer2D.play()

	queue_free()
