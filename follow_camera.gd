extends Camera2D

# TileMap
@onready var tile_map

func _ready():
	tile_map = get_node("../../TileMapLayer")
	var mapRect = tile_map.get_used_rect()
	var tileSize = tile_map.rendering_quadrant_size
	var worldSizeInPixels = mapRect.size * tileSize
	var upperLeftCorner = mapRect.position * tileSize
	var lowerRightCorner = (mapRect.position + mapRect.size) * tileSize
	
	limit_left = tile_map.position.x + upperLeftCorner.x
	limit_top = tile_map.position.y + upperLeftCorner.y
	limit_right = tile_map.position.x + lowerRightCorner.x
	limit_bottom = tile_map.position.y + lowerRightCorner.y
