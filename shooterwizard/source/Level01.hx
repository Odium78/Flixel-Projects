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
		makeLevel({x: 24, y: 24});
	}
}
