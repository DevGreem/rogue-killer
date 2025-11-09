extends Resource
class_name StatsModifierData

signal on_add_stat(stat: StatModifier)
signal on_remove_stat(stat: StatModifier)

@export var _stats: Dictionary[Enums.StatType, StatModifier] = {}

func get_stat(stat: Enums.StatType) -> StatModifier:
	return _stats.get(stat, null)

func set_stat(new_stat: StatModifier) -> void:
	
	if !_stats.has(new_stat.STAT_TYPE):
		on_add_stat.emit(new_stat)
	
	_stats[new_stat.STAT_TYPE] = new_stat

func add_to_stat_flat(stat: Enums.StatType, flat: float) -> void:
	add_to_stat(stat, flat)

func add_to_stat_modifier(stat: Enums.StatType, modifier: float) -> void:
	add_to_stat(stat, 0, modifier)

func add_to_stat(stat: Enums.StatType, flat: float = 0, modifier: float = 0) -> void:
	
	var actual_stat := get_stat(stat)
	
	var new_stat = StatModifier.new()
	new_stat.STAT_TYPE = new_stat
	new_stat.flat = flat+actual_stat.flat
	new_stat.modifier = modifier+actual_stat.modifier
	
	set_stat(new_stat)

func remove_stat(stat: Enums.StatType) -> void:
	
	var removed_stat := _stats[stat]
	
	on_remove_stat.emit(removed_stat)
	
	_stats.erase(stat)
