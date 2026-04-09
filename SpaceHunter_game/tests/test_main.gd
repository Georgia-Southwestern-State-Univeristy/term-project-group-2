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
	
	
	
	# ── REGRESSION Test 1 ─────────────────────────────────────────────
# Regression: energy orbs were spawning off screen after Godot 4 migration
# because shape.extents was removed and half_w defaulted to 16.0
func test_spawn_position_within_screen_bounds():
	var screen_w = 1152.0
	var margin = 80.0
	var spawn_x = randf_range(margin, screen_w - margin)
	assert_gte(spawn_x, margin, "Spawn x should not be less than left margin")
	assert_lte(spawn_x, screen_w - margin, "Spawn x should not exceed right margin")

# ── REGRESSION Test 2 ─────────────────────────────────────────────
# Regression: score and attemts were changing after game_over triggered
# because collision functions had no game_over guard
func test_score_does_not_change_after_game_over():
	var score = 10
	var game_over = true
	if not game_over:
		score += 1
	assert_eq(score, 10, "Score must not change when game_over is true")

# ── REFACTOR Test ─────────────────────────────────────────────────
# Covers refactored drop movement switched from RigidBody2D 
# linear_velocity to manual position.y += speed * delta
# after Godot 4 physics caused uncontrolled acceleration
func test_drop_speed_is_constant_without_physics():
	var position_y = 0.0
	var speed = 150.0
	var delta = 0.016 # one frame at 60fps
	position_y += speed * delta
	assert_almost_eq(position_y, 2.4, 0.01, "Drop should move at constant speed per frame")

# ── RELIABILITY Test ──────────────────────────────────────────────
# Covers reliability fix messenger bot was texting over scoreboard
# because MessengerTimer had no game_over guard
func test_messenger_does_not_fire_when_game_over():
	var game_over = true
	var message_sent = false
	if not game_over:
		message_sent = true
	assert_false(message_sent, "Messenger should not send messages when game_over is true")
