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
	public var player:Player;
	public var levelBounds:FlxGroup;
	public var bullet:Bullet;
	public var bullets = new FlxTypedGroup<FlxSprite>();
	public var level:TiledLevel;

	override public function create()
	{
		// FlxG.mouse.visible = false;
		bgColor = 0xffcccccc;
	}

	function makeLevel(levelPath:String, playerPos:{x:Int, y:Int})
	{
		level = new TiledLevel("assets/tiled/level.tmx", this);
		add(level.backgroundLayer);
		add(level.foregroundTiles);
		add(level.objectsLayer);
	}

	function shoot()
	{
		if (FlxG.mouse.justReleased)
		{
			if (player.facing == RIGHT)
			{
				bullet = new Bullet(player.x + 30, player.y + 13);
				bullets.add(bullet);
				add(bullets);

				bullet.velocity.x = 1024;
			}
			else if (player.facing == LEFT)
			{
				bullet = new Bullet(player.x - 30, player.y + 13);
				bullets.add(bullet);
				add(bullets);

				bullet.velocity.x = -1024;
			}
		}
	}

	function impact(__, bulletspr:FlxSprite)
	{
		bulletspr.kill();
	}

	override public function update(elapsed:Float)
	{
		shoot();
		super.update(elapsed);
		FlxG.collide(player, levelBounds);
		FlxG.overlap(levelBounds, bullets, impact);
	}
}
