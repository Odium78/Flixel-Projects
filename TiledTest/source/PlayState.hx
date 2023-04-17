package;

import flixel.FlxState;
import flixel.addons.tile.FlxTilemapExt;
import flixel.addons.tile.TiledMap;
import flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling;

class PlayState extends FlxState
{
	override public function create():Void
	{
		// Load the Tiled map from an XML file
		var tiledMap = TiledMap.fromFile("assets/data/level01.tmx");

		// Create a FlxTilemap from the Tiled map
		var tilemap = new FlxTilemapExt();
		tilemap.loadMapFromArray(tiledMap.layers[0].data, tiledMap.tileWidth, tiledMap.tileHeight, FlxTilemapAutoTiling.OFF, 0, 1, 1);

		// Add the FlxTilemap to the state
		add(tilemap);
	}
}
