extends Node
# server id is always 1
const SERVER: int = 1;

func move(po: String) -> bool:
    return rpc_id(SERVER, "move", po)

func game_end():
    rpc_id(SERVER, "game_end")
    # once game is end, this node will have no function until a new game is started/created

func set_player_name(player_name: String):
    rpc_id(SERVER, "set_player_name", player_name)

func list_rooms() -> Array:
    return rpc_id(SERVER, "list_rooms")

func join_room(room_id: int) -> bool:
    return rpc_id(SERVER, "join_room", room_id)

func create_room() -> int:
    return rpc_id(SERVER, "create_room")

func leave_room() -> int:
    return rpc_id(SERVER, "leave_room")

remote func game_stop(msg: String) -> void:
    pass

remote func game_start(first: bool, another_player: String) -> void:
    pass

remote func response(po: String) -> bool:
    pass

func _ready():
    pass
