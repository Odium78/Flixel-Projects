package;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;

class Level02 extends LevelState
{
	override public function create()
	{
		super.create();
		bgColor = 0xffcccccc;
		createLevel("level02", {x: 0, y: 48});
	}
}
