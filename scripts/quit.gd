extends Button

func _ready():
	var _ok = get_node(".").connect("button_up", self, "_on_quit")

func _on_quit():
	get_tree().quit()
