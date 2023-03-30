package;

import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{
	final SPEED:Int = 100;
	final GRAVITY:Int = 600;

	public function new(x:Int = 0, y:Int = 0)
	{
		super(x, y);
		loadGraphic("assets/images/player.png", true, 32, 48);
		drag.x = SPEED * 4;

		animation.add("run", [0, 1, 2], 6);
		animation.add("idle", [0], 6, false);

		setFacingFlip(LEFT, true, false);
		setFacingFlip(RIGHT, false, false);

		acceleration.y = GRAVITY;
	}

	function movement()
	{
		var left = FlxG.keys.anyPressed([LEFT, A]);
		var right = FlxG.keys.anyPressed([RIGHT, D]);

		if ((left || right) && !(left && right))
		{
			animation.play("run");
		}
		else
		{
			animation.play("idle");
		}

		if (left && right)
		{
			velocity.x = 0;
			animation.play("idle");
		}
		else if (left)
		{
			velocity.x = -SPEED;
			facing = LEFT;
		}
		else if (right)
		{
			velocity.x = SPEED;
			facing = RIGHT;
		}
	}

	function jumping()
	{
		final jump = FlxG.keys.anyPressed([UP, W, SPACE]);

		if (jump && isTouching(FLOOR))
		{
			velocity.y = -GRAVITY / 1.5;
		}
	}

	override public function update(elapsed:Float)
	{
		jumping();
		super.update(elapsed);
		movement();
	}
}
