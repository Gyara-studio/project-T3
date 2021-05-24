extends Node2D

var _ok

func _ready():
    _ok = $computer.connect("button_up", self, "choose_computer")
    _ok = $online.connect("button_up", self, "choose_online")
    _ok = $quit.connect("button_up", self, "choose_quit")

func choose_computer():
    g.mode = g.GameMode.Computer
    _ok = get_tree().change_scene("res://scene/Game.tscn")

func choose_online():
    g.mode = g.GameMode.Live
    _ok = get_tree().change_scene("res://scene/Live.tscn")

func choose_quit():
    get_tree().quit()
