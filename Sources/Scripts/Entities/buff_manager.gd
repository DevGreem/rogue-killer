extends Node

class_name BuffManager

signal on_add_buff(buff: Buff)
signal on_remove_buff(buff: Buff)

var _buffs: Dictionary[String, Buff]
