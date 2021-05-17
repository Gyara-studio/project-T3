extends Button

func _ready():
	var _ok = get_node(".").connect("button_up", self, "choose_computer")

func choose_computer():
	var _ok = get_tree().change_scene("res://scene/Game.tscn")
