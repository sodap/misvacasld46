package;

import Cow;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class Bullet extends FlxSprite
{
	public var faction:String = "HERO";

	static inline var SPEED:Float = 350;

	public function new(x:Float = 0, y:Float = 0, direction:Float = 0)
	{
		super(x, y);
		loadGraphic("assets/images/bulletstrip24.png", true, 24, 24, false);
		animation.add("HERO", [0], 10, false);
		animation.add("BANDIT", [1], 10, false);
		animation.play("HERO");
		width = 11;
		height = 11;
		offset.x = 6.5; // 24-11 * 0.5
		offset.y = 6.5;
		velocity.set(SPEED, 0);
		velocity.rotate(FlxPoint.weak(0, 0), direction);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (!isOnScreen())
		{
			kill();
		}
	}
}
