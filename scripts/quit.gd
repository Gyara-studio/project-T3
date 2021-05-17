extends Button

func _ready():
	var _ok = get_node(".").connect("button_up", self, "choose_quit")

func choose_quit():
	get_tree().quit()
