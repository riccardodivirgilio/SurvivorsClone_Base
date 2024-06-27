extends CharacterBody2D

@export var movement_speed = 60.0
@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite = $Sprite2D
@onready var walkTimer = $WalkTimer

func _physics_process(delta):
	var mov = global_position.direction_to(player.global_position)
	velocity = mov* movement_speed
	
	if mov != Vector2.ZERO:
		sprite.flip_h=mov.x > 0
		
		if walkTimer.is_stopped():
			if sprite.frame >= sprite.hframes -1:
				sprite.frame = 0
			else:
				sprite.frame += 1
			walkTimer.start()
	
	
	move_and_slide()
