extends CharacterBody2D

@export var speed: float = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	move()
	

func move() -> void:
	
	velocity.x = UserInput.get_axis().x * speed
	velocity.y = UserInput.get_axis().y * -speed
	
	move_and_slide()

func _input(event):
	
	if event is InputEventMouse:
		
		var direction = event.position
		
		look_at(direction)

func _physics_process(_delta: float) -> void:
	
	pass
