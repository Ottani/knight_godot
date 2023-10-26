extends CharacterBody2D

var type: String

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	type = ['mummy', 'skeleton', 'skeleton2', 'zombie', 'zombie2'].pick_random()
	velocity.x = randi_range(-200, 200)
	_get_animation()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())


func _process(_delta):
	_get_animation()

func _get_animation():
	if velocity.x < 0:
		$AnimatedSprite2D.animation = type + '_left'
	else:
		$AnimatedSprite2D.animation = type + '_right'
