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
<<<<<<< HEAD
	var player:Player;
	var bullet:Bullet;
=======
	public var level:TiledLevel;

	public var player:Player;
	public var levelBounds:FlxGroup;
	public var bullet:Bullet;
	public var bullets = new FlxTypedGroup<FlxSprite>();
>>>>>>> 0553b00de2e34b897be14decac97461baac1c3c1

	override public function create()
	{
		// FlxG.mouse.visible = false;
		bgColor = 0xffcccccc;
	}

	function makeLevel(levelPath:String, playerPos:{x:Int, y:Int})
	{
<<<<<<< HEAD
		final map = new TiledMap(levelPath);

=======
		level = new TiledLevel("assets/data/level.tmx", this);
>>>>>>> 0553b00de2e34b897be14decac97461baac1c3c1
		player = new Player(playerPos.x, playerPos.y);

		add(level.objectsLayer);
		add(level.backgroundLayer);
		add(player);
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
<<<<<<< HEAD
		shoot();
=======
		FlxG.collide(player, levelBounds);
		FlxG.overlap(levelBounds, bullets, impact);
>>>>>>> 0553b00de2e34b897be14decac97461baac1c3c1
	}
}
