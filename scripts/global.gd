extends Node

# args
enum GameMode { Live, Computer }

var mode: int = GameMode.Computer
var winner: String = ""

enum Piece {O = 2, X = 1, Null = 0}

var play_on: int = Piece.Null

func is_computer() -> bool:
	return mode == GameMode.Computer

func is_play_on(now: int) -> bool:
	return now == play_on
