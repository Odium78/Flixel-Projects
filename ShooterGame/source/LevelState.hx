package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxCollision;

class LevelState extends FlxState
{
	var player:Player;
	var bullet:Bullet;

	override public function create()
	{
		bgColor = 0xffcccccc;
	}

	function makeLevel(levelPath:String, playerPos:{x:Int, y:Int})
	{
		final map = new TiledMap(levelPath);

		player = new Player(playerPos.x, playerPos.y);
		add(player);
	}

	function shoot()
	{
		if (FlxG.mouse.justReleased)
		{
			if (player.facing == RIGHT)
			{
				bullet = new Bullet(player.x + 30, player.y + 13);
				add(bullet);

				bullet.velocity.x = 1024;
			}
			else if (player.facing == LEFT)
			{
				bullet = new Bullet(player.x - 30, player.y + 13);
				add(bullet);

				bullet.velocity.x = -1024;
			}
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		shoot();
	}
}
