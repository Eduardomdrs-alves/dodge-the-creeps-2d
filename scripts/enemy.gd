extends RigidBody2D

var speed = 0

func _ready():
	var enemy_animations = $AnimatedSprite2D.sprite_frames.get_animation_names()
	var random_index = randi() % enemy_animations.size()
	var animation_name = enemy_animations[random_index]
	$AnimatedSprite2D.play(animation_name)
	match animation_name:
		"walk":
			speed = 80.0
		"swim":
			speed = 120.0
		"fly":
			speed = 180.0
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("Destruindo inimigo!")
	queue_free()
