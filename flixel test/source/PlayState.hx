package;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;

class PlayState extends LevelState
{
	override public function create()
	{
		super.create();
		bgColor = 0xffcccccc;
		createLevel("level01", {x: 48, y: 672});
	}
}
