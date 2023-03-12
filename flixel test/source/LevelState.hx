package;

import flixel.FlxCamera.FlxCameraFollowStyle;
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
	final platformsGroup = new FlxTypedGroup<FlxSprite>();
	final starsGroup = new FlxTypedGroup<FlxSprite>();
	var hud:Hud;

	override public function create()
	{
		bgColor = 0xffcccccc;
	}

	function createLevel(levelName:String, playerPos:{x:Int, y:Int})
	{
		final map = new TiledMap('assets/data/$levelName.tmx');

		createPlatforms(map);
		createStars(map);
		player = new Player(playerPos.x, playerPos.y);
		add(player);

		levelBounds = FlxCollision.createCameraWall(FlxG.camera, true, 1);

		hud = new Hud();
		add(hud);
	}

	function createStars(map:TiledMap)
	{
		final starsLayer:TiledObjectLayer = cast(map.getLayer("stars"));

		for (stars in starsLayer.objects)
		{
			final starsSprites = new FlxSprite(stars.x, (stars.y - stars.height));
			starsSprites.loadGraphic("assets/images/star.png", false, 400, 32);
			starsSprites.immovable = true;
			starsGroup.add(starsSprites);
		}

		add(starsGroup);
	}

	function createPlatforms(map:TiledMap)
	{
		final platformsLayer:TiledObjectLayer = cast(map.getLayer("platforms"));

		for (platform in platformsLayer.objects)
		{
			final platformSprites = new FlxSprite(platform.x, (platform.y - platform.height));
			platformSprites.loadGraphic("assets/images/platform.png", false, 400, 32);
			platformSprites.immovable = true;
			platformsGroup.add(platformSprites);
		}

		add(platformsGroup);
	}

	function collectStar(_, star:FlxSprite)
	{
		hud.incrementScore();
		star.kill();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player, levelBounds);
		FlxG.collide(player, platformsGroup);
		FlxG.overlap(player, starsGroup, collectStar);
	}
}
