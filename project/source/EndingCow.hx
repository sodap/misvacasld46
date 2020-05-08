package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;

class EndingCow extends FlxSpriteGroup
{
	static inline var SPEED:Float = 200;

	var shadow:FlxSprite;
	var body:FlxSprite;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		shadow = new FlxSprite(0, 20);
		shadow.loadGraphic("assets/images/cowshadow.png");
		add(shadow);

		body = new FlxSprite(0, 20);
		body.loadGraphic("assets/images/cowstrip48.png", true, 48, 48);
		body.animation.add("walk", [3, 4, 5, 6], 10, true);
		body.animation.play("walk");
		add(body);
	}

	override function update(elapsed:Float)
	{
		velocity.set(30, 0);
		super.update(elapsed);
	}
}
