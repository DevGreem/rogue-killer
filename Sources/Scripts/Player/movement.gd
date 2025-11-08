extends CharacterBody2D

@export var speed: float = 10000.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var real_speed = speed
	
	if is_running(delta):
		real_speed *= $PlayerEntity.stats.run_speed
	
	velocity.x = UserInput.get_axis().x * real_speed * delta
	velocity.y = UserInput.get_axis().y * -real_speed * delta
	
	move_and_slide()

func is_running(delta: float) -> bool:
	
	if $PlayerEntity.stats.stamine_duration.min_value <= 0:
		return false
	
	if Input.is_key_pressed(KEY_SHIFT):
		print("Is running")
		print($PlayerEntity.stats.stamine_duration)
		$PlayerEntity.stats.stamine_duration.min_value -= delta
		return true
	
	return false

func _input(event):
	
	if event is InputEventMouse:
		
		var direction = event.position
		
		look_at(direction)
