package;

import PlayState;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxAngle;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class CowHitBox extends FlxSprite
{
	public var parent:Cow;

	public function new(x:Float = 0, y:Float = 0, _parent:Cow)
	{
		super(x, y);
		loadGraphic("assets/images/emptycow.png");
		width = 24;
		height = 24;
		offset.x = 12; //-24;
		offset.y = 12; //-24;
		parent = _parent;
	}
}

class Cow extends FlxSpriteGroup
{
	static inline var SPEED:Float = 100;
	static inline var DISTANCE_TO_MOVE:Float = 32;

	var shadow:FlxSprite;

	var body:FlxSprite;

	public var hitBox:CowHitBox;
	public var gotHit:Bool;
	public var traceText:String;

	static var hitSounds:Array<String> = ["assets/sounds/hit1.wav", "assets/sounds/hit2.wav",];

	var deathSounds:Array<String>;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		gotHit = false;
		width = 12;
		height = 24;
		offset.x = 0; //-24;
		offset.y = 0; //-24;

		shadow = new FlxSprite(0, 0);
		shadow.loadGraphic("assets/images/cowshadow.png");
		shadow.setFacingFlip(FlxObject.LEFT, true, false);
		shadow.setFacingFlip(FlxObject.RIGHT, false, false);
		shadow.width = 24;
		shadow.height = 24;
		shadow.offset.x = 12; //-24;
		shadow.offset.y = 12; //-24;
		add(shadow);

		body = new FlxSprite(0, 0);
		body.loadGraphic("assets/images/cowstrip48.png", true, 48, 48);
		body.setFacingFlip(FlxObject.LEFT, true, false);
		body.setFacingFlip(FlxObject.RIGHT, false, false);

		body.animation.add("walk", [3, 4, 5, 6], 10, true);
		body.animation.add("idle", [0, 1, 2], 5, true);
		body.animation.add("corpse", [7], 10, true);
		body.animation.add("hurt", [8], 10, false);
		body.animation.play("idle");
		body.width = 24;
		body.height = 24;
		body.offset.x = 12; //-24;
		body.offset.y = 12; //-24;

		add(body);

		hitBox = new CowHitBox(0, 0, this);
		add(hitBox);

		deathSounds = [for (i in 1...6) 'assets/sounds/muerte_vaca_' + i + '.wav'];

		drag.x = drag.y = 1600;
	}

	override function update(elapsed:Float)
	{
		if (hitBox.alive && !PlayState.game.stagePaused)
		{
			updateMovement();
		}
		else if (!hitBox.alive && body.animation.finished)
		{
			body.animation.play("corpse");
		}

		super.update(elapsed);
	}

	public function getHit():Void
	{
		body.animation.play("hurt");
		var _randomSound:Int = Math.round((deathSounds.length - 1) * Math.random());
		var _chosenSound:String = deathSounds[_randomSound];
		var _sound = FlxG.sound.play(_chosenSound);
		_sound.proximity(x, y, PlayState.audioListener, 270, true);
		_sound.volume = 0.65;
		var _randomSound2:Int = Math.round(Math.random());
		var _chosenSound2:String = hitSounds[_randomSound2];
		var _sound2 = FlxG.sound.play(_chosenSound2);
		_sound2.proximity(x, y, PlayState.audioListener, 270, true);
	}

	public function updateMovement()
	{
		var escapeDirection = FlxAngle.angleBetween(PlayState.game.hero.body, this.body, true);
		var heroDistance = FlxMath.distanceBetween(this.body, PlayState.game.hero.body);

		var banditDistance = 9999.0;
		for (i in 0...PlayState.game.bandits.members.length)
		{
			var _newDistance = FlxMath.distanceBetween(this.body, PlayState.game.bandits.members[i]);
			if (_newDistance < banditDistance)
			{
				banditDistance = _newDistance;
				if (heroDistance > 56)
				{
					escapeDirection = FlxAngle.angleBetween(PlayState.game.bandits.members[i], this.body, true);
				}
			}
		}

		if (facing == FlxObject.LEFT) {}
		var movementAngleRadians = Math.PI / 180 * escapeDirection;
		var movePoint:FlxPoint = FlxPoint.weak(x
			- offset.x
			+ DISTANCE_TO_MOVE * Math.cos(movementAngleRadians),
			y
			- offset.y
			+ DISTANCE_TO_MOVE * Math.sin(movementAngleRadians));
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		if (heroDistance < 56 || banditDistance < 56)
		{
			velocity.set(SPEED, 0);
			velocity.rotate(FlxPoint.weak(0, 0), escapeDirection);
		}
		else
		{
			velocity.set(0);
		}

		if (velocity.x > 0)
		{
			facing = FlxObject.RIGHT;
		}
		if (velocity.x < 0)
		{
			facing = FlxObject.LEFT;
		}
		/*
			var newAngle:Float = 0;
			if (up)
			{
				newAngle = -90;
				if (left)
				{
					newAngle -= 45;
					facing = FlxObject.LEFT;
				}
				else if (right)
				{
					newAngle += 45;
					facing = FlxObject.RIGHT;
				}
			}
			else if (down)
			{
				newAngle = 90;
				if (left)
				{
					newAngle += 45;
					facing = FlxObject.LEFT;
				}
				else if (right)
				{
					newAngle -= 45;
					facing = FlxObject.RIGHT;
				}
			}
			else if (left)
			{
				newAngle = 180;
				facing = FlxObject.LEFT;
			}
			else if (right)
			{
				newAngle = 0;
				facing = FlxObject.RIGHT;
			}

			if (up || down || right || left)
			{
				velocity.set(SPEED, 0);
				velocity.rotate(FlxPoint.weak(0, 0), newAngle);
		}*/

		if (velocity.x == 0 && velocity.y == 0)
		{
			body.animation.play("idle");
		}
		else
		{
			body.animation.play("walk");
		}

		x = FlxMath.bound(x, 4, 316 - width);
		y = FlxMath.bound(y, 4, 236 - height);
	}
}
