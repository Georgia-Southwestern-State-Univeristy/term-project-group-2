extends Node

func energy_catch(score):
	return score + 1

func asteroid_hit(life):
	return life - 1

func check_game_over(life):
	return life <= 0
