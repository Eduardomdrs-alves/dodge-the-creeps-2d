extends RigidBody2D

@export var speed := 220
var player = null
var chasing_time := 5.0

func _ready():
	modulate = Color(1, 0.2, 0.2) 
	$AnimatedSprite2D.play("fly")
	player = get_tree().get_first_node_in_group("player")
	# duração do "modo perseguição"
	await get_tree().create_timer(chasing_time).timeout
	# depois disso ele “desiste”
	player = null
	# e sai da tela
	linear_velocity = Vector2(200, 0).rotated(rotation)
	await get_tree().create_timer(2.0).timeout
	queue_free()

func _physics_process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		linear_velocity = direction * speed
		
		rotation = direction.angle()
