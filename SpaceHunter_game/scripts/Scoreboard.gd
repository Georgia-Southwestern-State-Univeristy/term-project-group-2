extends Node

var scoreboard_node: Node = null

func setup(node: Node):
	scoreboard_node = node

func show(score: int):
	if not is_instance_valid(scoreboard_node):
		push_error("Scoreboard node not found")
		return
	scoreboard_node.get_node("VBox/FinalScore").text = "Final Score: %d" % score
	scoreboard_node.get_node("VBox/RestartHint").text = "Press ENTER to play again"
	scoreboard_node.visible = true

func hide_board():
	if is_instance_valid(scoreboard_node):
		scoreboard_node.visible = false
