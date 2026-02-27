extends Node

signal player_killed(reason: String)
signal item_collected(type: String, count: int, value: float)
signal timer_updated(type: String, percent: float, is_active: bool)
#signal request_restart
#signal score_updated(new_score: int)
