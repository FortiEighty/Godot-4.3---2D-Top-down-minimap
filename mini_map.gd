extends Node2D

# These will allow us to assign player and tilemap layer object from inspector
# We will use them for tracking and macking our minimap
@export var player : CharacterBody2D
@export var tileMap : TileMapLayer
	
@onready var sub_viewport = $SubViewportContainer/SubViewport

var miniMapPlayer

func _ready():
	# Creating a duplicate of our player
	miniMapPlayer = player.duplicate()
	
	# Inserting the duplicate of the tilemap layer inside the container
	# So map will look like a tilemap
	sub_viewport.add_child(tileMap.duplicate())
	# Adding a player icon to a map
	sub_viewport.add_child(miniMapPlayer)

func _process(delta: float) -> void:
	# With each frame we update the position of the player in minimap
	# And camera according to the real position
	miniMapPlayer.position = player.position
	$SubViewportContainer/SubViewport/Camera2D.position = miniMapPlayer.position
