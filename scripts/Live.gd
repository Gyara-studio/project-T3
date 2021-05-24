extends Node2D

# setting
const SERVER_IP: String = ""
const SERVER_PORT: int = 5000

const persisten: String = "data.save"
var player_name: String = "Player X"
var _ok

func load_name():
    var file := File.new()
    if not file.file_exists(persisten):
        return
    _ok = file.open(persisten, file.READ)
    player_name = file.get_line()
    file.close()

func save_name():
    var save_game = File.new()
    save_game.open(persisten, File.WRITE)
    save_game.store_line(player_name)
    save_game.close()

const link = preload("res://scene/Link.tscn")
var my_id: int
func link_start(id: int):
    my_id = id
    var link_node = link.instance()
    link_node.set_name(str(id))
    $"/root/Players".add_child(link_node)

func get_link() -> Node:
    if my_id == null:
        pass
    return get_node("/root/Players" + str(my_id))

func _ready():
    # set up ui
    load_name()
    $menu/player_name.text = player_name
    $menu/join.disabled = true
    _ok = $menu/join.connect("button_up", self, "join_game")
    _ok = $menu/create.connect("button_up", self, "create_game")
    _ok = $menu/quit.connect("button_up", self, "quit")
    _ok = $menu/player_name.connect("text_changed", self, "update_name")
    # init network
    var player_node = Node.new()
    player_node.set_name("Players")
    get_tree().get_root().add_child(player_node)
    var peer = NetworkedMultiplayerENet.new()
    peer.create_client(SERVER_IP, SERVER_PORT)
    get_tree().set_network_peer(peer)
    _ok = get_tree().connect("network_peer_connected", self, "link_start")
    _ok = get_tree().connect("network_peer_disconnected", self, "quit")

func update_name(new: String):
    player_name = new
    save_name()

func join_game():
    pass

func create_game():
    pass

func quit():
    get_tree().set_network_peer(null)
    _ok = get_tree().change_scene("res://scene/Level select.tscn")
