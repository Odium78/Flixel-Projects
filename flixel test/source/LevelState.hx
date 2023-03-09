import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.group.FlxGroup.FlxTypedGroup;

class LevelState extends FlxState
{
	function createLevel()
	{
		final map = new TiledMap("assets/data/levelOne.tmx");
		final platformsLayer:TiledObjectLayer = cast(map.getLayer("platforms"));
		final platformsGroup = new FlxTypedGroup<FlxSprite>();

		for (platform in platformsLayer.objects)
		{
			final platformSprites = new FlxSprite(platform.x, platform.y);
			platformSprites.loadGraphic("assets/images/platformer.png", false, 400, 32);
			platformsGroup.add(platformSprites);
		}

		add(platformsGroup);
	}
}
