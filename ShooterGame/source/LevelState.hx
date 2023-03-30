package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;

class LevelState extends FlxState
{
	var player:Player;
	var levelBounds:FlxGroup;
	var bullet:Bullet;

	override public function create()
	{
		bgColor = 0xffcccccc;
	}

	function makeLevel(playerPos:{x:Int, y:Int})
	{
		player = new Player(playerPos.x, playerPos.y);
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
		FlxG.collide(player, levelBounds);
		shoot();
	}
}
