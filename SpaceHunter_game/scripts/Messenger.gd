extends Node

var is_typing = false
var orbs_since_message = 0
var asteroids_since_message = 0

var orb_messages = [
	"Great job!",
	"Awesome catch!",
	"Energy secured!",
	"Nice one!",
	"You are a natural!",
	"Keep it up!",
	"Excellent flying!",
	"That is what I am talking about!"
]

var asteroid_messages = [
	"Be careful out there!",
	"This is dangerous!",
	"Watch your step!",
	"That one hurt!",
	"Stay focused!",
	"Avoid those rocks!",
	"Shields taking damage!",
	"That was close!"
]

var idle_messages = [
	"It is so good to be a space hunter!",
	"I am glad to help!",
	"Space is full of surprises.",
	"Stay sharp out there.",
	"The stars are beautiful tonight.",
	"I have your back, pilot.",
	"Sensors are clear... for now.",
	"What a time to be alive!"
]

var dialogue_box: Node = null

func setup(box: Node):
	dialogue_box = box

func show_message(text):
	if not is_instance_valid(dialogue_box):
		push_error("DialogueBox node not found")
		return
	if is_typing:
		return
	_type_message(text)

func _type_message(text):
	dialogue_box.visible = true
	dialogue_box.get_node("NameLabel").text = "> Messenger"
	dialogue_box.get_node("MessageLabel").text = ""
	is_typing = true
	var i = 0
	while i < text.length():
		dialogue_box.get_node("MessageLabel").text += text[i]
		i += 1
		await get_tree().create_timer(0.05).timeout
	await get_tree().create_timer(2.5).timeout
	dialogue_box.visible = false
	is_typing = false

func on_orb_caught():
	orbs_since_message += 1
	if orbs_since_message >= 3:
		orbs_since_message = 0
		show_message(orb_messages[randi() % orb_messages.size()])

func on_asteroid_missed():
	asteroids_since_message += 1
	if asteroids_since_message >= 3:
		asteroids_since_message = 0
		show_message(asteroid_messages[randi() % asteroid_messages.size()])

func on_idle():
	show_message(idle_messages[randi() % idle_messages.size()])
