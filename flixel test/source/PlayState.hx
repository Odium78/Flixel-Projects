package;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;

class PlayState extends LevelState
{
	var levelBounds:FlxGroup;
	var player:Player;

	override public function create()
	{
		super.create();
		bgColor = 0xffcccccc;

		createLevel();
		player = new Player(500, 200);

		add(player);

		levelBounds = FlxCollision.createCameraWall(FlxG.camera, true, 1);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, levelBounds);
	}
}
