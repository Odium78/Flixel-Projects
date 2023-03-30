package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;

class LevelState extends FlxState
{
	var player:Player;
	var levelBounds:FlxGroup;

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

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, levelBounds);
	}
}
