extends Node

class_name StatsComponent

signal on_add_stat(stat: Stat)
signal on_remove_stat(stat: Stat)

@export var _stats: Dictionary[Enums.StatType, Stat]

func get_stat(stat: Enums.StatType) -> Stat:
	return _stats.get(stat, null)

func set_stat(new_stat: Stat) -> void:
	
	if !_stats.has(new_stat.STAT_TYPE):
		on_add_stat.emit(new_stat)
	
	_stats[new_stat.STAT_TYPE] = new_stat

func add_to_stat_flat(stat: Enums.StatType, flat: float) -> void:
	add_to_stat(stat, flat)

func add_to_stat_modifier(stat: Enums.StatType, modifier: float) -> void:
	add_to_stat(stat, 0, modifier)

func add_to_stat(stat: Enums.StatType, flat: float = 0, modifier: float = 0) -> void:
	
	var actual_stat := get_stat(stat)
	
	set_stat(
		Stat.new(
			stat,
			actual_stat.flat+flat,
			actual_stat.modifier+modifier
		)
	)

func remove_stat(stat: Enums.StatType) -> void:
	
	var removed_stat := _stats[stat]
	
	on_remove_stat.emit(removed_stat)
	
	_stats.erase(stat)
