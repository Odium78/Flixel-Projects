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
		createLevel({x: 48, y: 672});
	}
}
