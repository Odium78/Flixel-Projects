package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;

class LevelState extends FlxState
{
	public var level:TiledLevel;

	public var player:Player;
	public var levelBounds:FlxGroup;
	public var bullet:Bullet;
	public var bullets = new FlxTypedGroup<FlxSprite>();

	override public function create()
	{
		// FlxG.mouse.visible = false;
		bgColor = 0xffcccccc;
	}

	function makeLevel(playerPos:{x:Int, y:Int})
	{
		level = new TiledLevel("assets/data/level.tmx", this);
		player = new Player(playerPos.x, playerPos.y);

		add(level.objectsLayer);
		add(level.backgroundLayer);
		add(player);

		levelBounds = FlxCollision.createCameraWall(FlxG.camera, true, 1);
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
