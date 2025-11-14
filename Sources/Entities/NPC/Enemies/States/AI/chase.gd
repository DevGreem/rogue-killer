extends StateBase

class_name EnemyChaseAIState

signal on_exit_player(body: Player)

var enemy: Enemy
var player: Player
var attack_machine: StateMachine

func start():
	enemy = state_owner
	attack_machine = $"../../AttackStateMachine"
	super.start()

func end():
	player = null
	super.end()

func _on_physics_process(_delta: float):
	
	enemy.look_at(player.global_position)
	
	var stats := enemy.data.stats
	
	var direction := enemy.global_position.direction_to(player.global_position)
	
	enemy.velocity = direction*stats.speed.walking
	
	enemy.move_and_slide()

func _on_exit_player(body: Node2D) -> void:
	
	if not body is Player:
		return
	
	on_exit_player.emit(body)
	state_machine.set_state($"../Patrol")

func _patrol_on_detect_player(body: Node2D) -> void:
	player = body as Player
