package;

import flixel.FlxG;
import flixel.FlxSprite;

class Bullet extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		loadGraphic("assets/images/bullet.png", true, 24, 8);

		setFacingFlip(LEFT, true, false);
		setFacingFlip(RIGHT, false, false);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
