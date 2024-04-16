extends Node 

## Base class for troop
class_name TroopAttribute


## Stores data on the attribute description
var attribute: Attribute
## Troop object which the attribute is attached to
var parent: Troop
## The game state
var board: Board

## Attaches the troop attribute to a game object and a troop object.
## Also sets up the attribute's description.
func setup(attribute_id: int, game: Game, troop: Troop):
    attribute = load("res://Attributes/Troops/Data/attribute_{0}.tres".format({0: attribute_id}))
    parent = troop
    board = game.board

## Uses a .tscn file to add a description, name, abbreviation, and id to the attribute
func add_description(desc: Attribute):
    attribute = desc


# Virtual function which can be overwritten by children
func on_moved(troop: Troop, from: Vector2i, to: Vector2i):
    pass


## Virtual function which overrides movement costs.
## Overrides to this function can return a non-null value to change the move calculation.
## Otherwise, returning null uses the default troop calculation.
## For information on the parameters, see [method Troop._calc_move_cost]
func calc_move_cost(strength: float, from: Vector2i, to: Vector2i, board: Board):
    return null


## Virtual function which overrides fog clearing.
## Overrides to this function can return a non-null value to change the fog clearing.
## Otherwise, returning null uses the default.
func clear_fog(pos: Vector2i):
    return null