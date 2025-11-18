extends Node

func connect_if_not_connected(event: Signal, function: Callable):
	
	if not event.is_connected(function):
		event.connect(function)
		
