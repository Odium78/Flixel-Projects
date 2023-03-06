package;

import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		bgColor = 0xffcccccc;
		final player = new Player();
		add(player);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
