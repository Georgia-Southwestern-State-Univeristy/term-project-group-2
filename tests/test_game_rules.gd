extends Node

var rules = preload("res://scripts/game_rules.gd").new()

func _ready():
	test_energy()
	test_asteroid()
	test_failure()
	test_boundary()

	print("ALL TESTS DONE")
	get_tree().quit()


func test_energy():
	var score = 0
	var new_score = rules.energy_catch(score)

	if new_score == 1:
		print("PASS energy")
	else:
		print("FAIL energy")


func test_asteroid():
	var life = 3
	var new_life = rules.asteroid_hit(life)

	if new_life == 2:
		print("PASS asteroid")
	else:
		print("FAIL asteroid")


func test_failure():
	var game_over = true
	var score = 5
	var new_score

	if game_over:
		new_score = score
	else:
		new_score = rules.energy_catch(score)

	if new_score == 5:
		print("PASS failure")
	else:
		print("FAIL failure")


func test_boundary():
	var life = 1
	life = rules.asteroid_hit(life)

	if rules.check_game_over(life):
		print("PASS boundary")
	else:
		print("FAIL boundary")
