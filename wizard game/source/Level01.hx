package;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;

class Level01 extends LevelState
{
	override public function create()
	{
		super.create();
		bgColor = 0xffcccccc;
		// nextLevel = Level02;
		createLevel("level01", {x: 24, y: 432});
	}
}
