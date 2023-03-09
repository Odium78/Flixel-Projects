import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.util.FlxCollision;

class LevelState extends FlxState
{
	var levelBounds:FlxGroup;
	var player:Player;

	override public function create()
	{
		bgColor = 0xffcccccc;
	}

	function createLevel(levelName:String, playerPos:{x:Int, y:Int})
	{
		final map = new TiledMap('assets/data/$levelName.tmx');
		final platformsLayer:TiledObjectLayer = cast(map.getLayer("platforms"));
		final platformsGroup = new FlxTypedGroup<FlxSprite>();

		for (platform in platformsLayer.objects)
		{
			final platformSprites = new FlxSprite(platform.x, platform.y);
			platformSprites.loadGraphic("assets/images/platform.png", false, 400, 32);
			platformsGroup.add(platformSprites);
		}

		add(platformsGroup);

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
