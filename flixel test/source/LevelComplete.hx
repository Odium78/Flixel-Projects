import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;

class LevelComplete extends FlxSubState
{
	var _nextlevel:Class<LevelState>;

	public function new(nextLevel:Class<LevelState>)
	{
		super(0x61000000);
		_nextlevel = nextLevel;
	}

	override public function create()
	{
		super.create();

		final boundingBox = new FlxSprite();
		boundingBox.makeGraphic(460, 197, 0xff42888F);

		boundingBox.screenCenter();

		add(boundingBox);

		final levelCompleteText = new FlxText(0, (boundingBox.y + 45), 0, "LEVEL COMPLETE", 36);

		final subCompleteText = new FlxText(0, (boundingBox.y + 135), 0, "Press Space to Continue", 18);

		if (_nextlevel == null)
		{
			levelCompleteText.text = "Thanks for playing!";
			subCompleteText.text = "Press Space to Retry";
		}
		levelCompleteText.screenCenter(X);

		add(levelCompleteText);

		subCompleteText.screenCenter(X);

		add(subCompleteText);
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			if (_nextlevel == null)
			{
				FlxG.switchState(new Level01());
			}
			else
			{
				FlxG.switchState(Type.createInstance(_nextlevel, []));
				close();
			}
		}
	}
}
