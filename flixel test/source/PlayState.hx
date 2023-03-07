package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxCollision;

class PlayState extends FlxState
{
	var levelBounds:FlxGroup;
	var player:Player;

	override public function create()
	{
		super.create();
		bgColor = 0xffcccccc;
		player = new Player();

		add(player);

		levelBounds = FlxCollision.createCameraWall(FlxG.camera, true, 1);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, levelBounds);
	}
}
