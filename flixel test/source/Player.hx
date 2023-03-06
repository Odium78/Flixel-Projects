package;

import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{
	final SPEED:Int = 100;

	public function new(x:Int = 0, y:Int = 0)
	{
		super(x, y);
		loadGraphic("assets/images/dude.png", true, 32, 48);
		drag.x = SPEED * 4;

		animation.add("run", [0, 1, 2, 3], 12);
		animation.add("idle", [0], 12, false);

		setFacingFlip(LEFT, false, false);
		setFacingFlip(RIGHT, true, false);
	}

	function movement()
	{
		final left = FlxG.keys.anyPressed([LEFT, A]);
		final right = FlxG.keys.anyPressed([RIGHT, D]);

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

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		movement();
	}
}
