## 4 new automated tests added this week required
- at least 2 tests tied to the primary end-to-end workflow
  - test_score_starts_at_zero
  - test_life_starts_at_five
  - test_drop_speed_cap
  - test_score_floor


- at least 1 integration or multi-component behavior test
  - test_admin_mode_starts_false
  - test_game_over_when_life_zero
  - test_drop_speed_increases_with_score


- at least 1 failure-path or regression test
  - test_score_does_not_increase_when_game_over
  - test_game_over_starts_false


## Test Cases
  res://tests/test_main.gd
  - test_score_starts_at_zero
  - test_life_starts_at_five
  - test_game_over_starts_false
  - test_admin_mode_starts_false
  - test_drop_speed_cap
  - test_score_floor
  - test_game_over_when_life_zero
  - test_drop_speed_increases_with_score
  - test_score_does_not_increase_when_game_over
 
## Show evidence that CI ran successfully on relevant PRs
- CI: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/actions/runs/23701305201/job/69045356512


## If CI failed during the week, briefly document what broke and how it was corrected
CI broke when the GUT was not downloaded and was able to test. We had to correct the test cases and CI. yml file with the right version to have CI passed.


## PR links
- PR: - https://github.com/Georgia-Southwestern-State-Univeristy/term-project-group-2/pull/247

## Test notes
- Testing end to end workflow to ensure there are no bugs when player plays
- Game UI has been corrected to display all objects within the frame
