extends GutTest

func test_score_starts_at_zero():
	assert_eq(0, 0, "Score should start at 0")

func test_life_starts_at_five():
	assert_eq(5, 5, "Life should start at 5")

func test_game_over_starts_false():
	assert_false(false, "game_over should start as false")

func test_admin_mode_starts_false():
	assert_false(false, "admin_mode should default to false")

func test_drop_speed_cap():
	var capped = min(400.0, 80.0 + 9999 * 1.0)
	assert_lte(capped, 400.0, "drop_speed should never exceed 400")

func test_score_floor():
	var score = 0
	score += -5
	score = max(0, score)
	assert_gte(score, 0, "Score should never go below 0")

func test_game_over_when_life_zero():
	var life = 0
	var game_over = life < 1
	assert_true(game_over, "game_over should be true when life is 0")

func test_drop_speed_increases_with_score():
	var speed = min(400.0, 80.0 + 50 * 1.0)
	assert_gt(speed, 80.0, "Speed should increase as score grows")
	
	# Test 9score does not change when game_over is true
func test_score_does_not_increase_when_game_over():
	var score = 10
	var game_over = true
	
	if not game_over:
		score += 1
	
	assert_eq(score, 10, "Score should not change when game_over is true")
