package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

class EndingHero extends FlxSpriteGroup
{
	static inline var SPEED:Float = 200;

	var shadow:FlxSprite;
	var body:FlxSprite;
	var gun:FlxSprite;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		shadow = new FlxSprite(0, 20);
		shadow.loadGraphic("assets/images/heroshadow.png");
		shadow.offset.y = -100;
		add(shadow);

		body = new FlxSprite(0, 20);
		body.loadGraphic("assets/images/herostrip48.png", true, 48, 48);
		body.animation.add("walk", [2, 3, 4, 5, 6, 7], 10, true);
		body.animation.play("walk");
		add(body);

		gun = new FlxSprite(0, 20);
		gun.loadGraphic("assets/images/gun.png", false, 48, 48);
		add(gun);
	}

	override function update(elapsed:Float)
	{
		velocity.set(30, 0);
		super.update(elapsed);
	}
}
