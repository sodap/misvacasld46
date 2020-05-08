package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class Blood extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0, _facing = FlxObject.LEFT)
	{
		super(x, y);
		loadGraphic("assets/images/bloodstrip24.png", true, 24, 24, false);
		animation.add("Blood3", [0, 1, 2, 3, 4], 15, false);
		animation.add("Blood2", [5, 6, 7, 8, 9], 15, false);
		animation.add("Blood1", [5, 6, 7, 8, 9], 8, false);
		var _fxnumber = Math.random() * 10;
		var _fxstring = "Blood3";
		if (_fxnumber > 5)
			_fxstring = "Blood2";
		if (_fxnumber > 8.5)
			_fxstring = "Blood1";
		animation.play(_fxstring);
		width = 11;
		height = 11;
		offset.x = 6.5; // 24-11 * 0.5
		offset.y = 6.5;
		facing = _facing;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (animation.finished)
		{
			kill();
		}
	}
}
