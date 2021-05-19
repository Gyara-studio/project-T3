extends Node

# args
enum GameMode { Live, Computer }

var mode: int = GameMode.Computer
var winner: String = ""

enum Status {O = 2, X = 1, Null = 0}

var play_on: int = Status.Null
