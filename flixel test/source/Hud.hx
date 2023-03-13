import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets;
import flixel.text.FlxText;

class Hud extends FlxTypedGroup<FlxSprite>
{
	var scoreText:FlxText;

	public var score = 0;

	public function new()
	{
		super();
		FlxAssets.FONT_DEFAULT = "assets/fonts/Prompt.ttf";
		scoreText = new FlxText(31, 32, 131, "Score: 0", 20);
		// scoreText.setFormat("assets/fonts/Prompt.ttf");
		scoreText.scrollFactor.set(0, 0);
		add(scoreText);
	}

	public function incrementScore()
	{
		score++;
		scoreText.text = 'Score: $score';
	}
}
