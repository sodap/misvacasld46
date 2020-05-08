package;

import PlayState;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxAngle;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.util.FlxColor;

class HeroHitBox extends FlxSprite
{
	public var parent:Hero;

	public function new(x:Float = 0, y:Float = 0, _parent:Hero)
	{
		super(x, y);
		loadGraphic("assets/images/emptycow.png");
		width = 12;
		height = 24;
		offset.x = 18; //-24;
		offset.y = 12; //-24;
		parent = _parent;
	}
}

class Hero extends FlxSpriteGroup
{
	static inline var SPEED:Float = 200;

	var shadow:FlxSprite;

	public var body:FlxSprite;
	public var hitBox:HeroHitBox;

	var gun:FlxSprite;

	static var shootSounds:Array<String> = [
		"assets/sounds/Disparo 1.wav",
		"assets/sounds/Disparo 2.wav",
		"assets/sounds/Disparo 3.wav",
		"assets/sounds/Disparo 4.wav",
		"assets/sounds/Disparo 5.wav",
		"assets/sounds/Disparo 6.wav",
		"assets/sounds/Disparo 7.wav",
		"assets/sounds/Disparo 8.wav",
		"assets/sounds/Disparo 9.wav",
	];

	static var hitSounds:Array<String> = ["assets/sounds/hit1.wav", "assets/sounds/hit2.wav",];

	static var stepSounds:Array<String>;

	var currentStepSound:FlxSound;

	public function new(x:Float = 0, y:Float = 0)
	{
		stepSounds = [for (i in 1...9) 'assets/sounds/step' + i + '.wav'];
		currentStepSound = new FlxSound();
		super(x, y);
		width = 12;
		height = 24;
		offset.x = 0; //-24;
		offset.y = 0; //-24;

		shadow = new FlxSprite(0, 0);
		shadow.loadGraphic("assets/images/heroshadow.png");
		shadow.setFacingFlip(FlxObject.LEFT, true, false);
		shadow.setFacingFlip(FlxObject.RIGHT, false, false);
		shadow.width = 12;
		shadow.height = 24;
		shadow.offset.x = 18; //-24;
		shadow.offset.y = 12; //-24;
		add(shadow);

		body = new FlxSprite(0, 0);
		body.loadGraphic("assets/images/herostrip48.png", true, 48, 48);
		body.setFacingFlip(FlxObject.LEFT, true, false);
		body.setFacingFlip(FlxObject.RIGHT, false, false);

		body.animation.add("walk", [2, 3, 4, 5, 6, 7], 10, true);
		body.animation.add("idle", [0, 1], 10, true);
		body.animation.add("corpse", [8], 10, false);
		body.animation.add("hurt", [9], 5, false);
		body.animation.play("idle");
		body.width = 12;
		body.height = 24;
		body.offset.x = 18; //-24;
		body.offset.y = 12; //-24;

		add(body);

		gun = new FlxSprite(0, 0);
		gun.loadGraphic("assets/images/gun.png", false, 48, 48);
		gun.setFacingFlip(FlxObject.LEFT, true, false);
		gun.setFacingFlip(FlxObject.RIGHT, false, false);

		gun.width = 12;
		gun.height = 24;
		gun.offset.x = 18; //-24;
		gun.offset.y = 12; //-24;
		add(gun);

		hitBox = new HeroHitBox(0, 0, this);
		add(hitBox);

		drag.x = drag.y = 1600;
	}

	function getRandomStepSound():Int
	{
		return Math.round((stepSounds.length - 1) * Math.random());
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
			remove(gun);
		}
		super.update(elapsed);
	}

	public function getHit():Void
	{
		PlayState.game.loseTimer = PlayState.loseTimerDuration;
		PlayState.game.winTimer = PlayState.loseTimerDuration * 2;
		body.animation.play("hurt");
		var _sound = FlxG.sound.play("assets/sounds/muerte_bandido_15.wav");
		_sound.proximity(x, y, PlayState.audioListener, 270, true);
		_sound.volume = 0.4;

		var _randomSound2:Int = Math.round(Math.random());
		var _chosenSound2:String = hitSounds[_randomSound2];
		var _sound2 = FlxG.sound.play(_chosenSound2);
		_sound2.proximity(x, y, PlayState.audioListener, 270, true);
	}

	function updateMovement()
	{
		var mouseDirection = FlxAngle.angleBetweenMouse(this, true);
		gun.angle = mouseDirection;
		if (Math.abs(mouseDirection) >= 90)
			facing = FlxObject.LEFT;
		else
			facing = FlxObject.RIGHT;

		if (facing == FlxObject.LEFT)
		{
			gun.angle += 180;
		}
		var gunAngleRadians = Math.PI / 180 * mouseDirection;
		if (FlxG.mouse.justReleased)
		{
			var _randomSound:Int = Math.round((shootSounds.length - 1) * Math.random());
			var _chosenSound:String = shootSounds[_randomSound];
			var _sound = FlxG.sound.play(_chosenSound);
			_sound.proximity(x, y, PlayState.audioListener, 320, true);
			FlxG.camera.shake(0.005, 0.1);
			gunAngleRadians = Math.PI / 180 * (mouseDirection + (0.5 - Math.random()) * 35);
			var gunPoint:FlxPoint = FlxPoint.weak(x - offset.x + 22 * Math.cos(gunAngleRadians), y - offset.y + 22 * Math.sin(gunAngleRadians));
			PlayState.game.spawnBullet(gunPoint.x, gunPoint.y, mouseDirection, "HERO");
		}
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);

		if (up && down)
			up = down = false;
		if (left && right)
			left = right = false;

		var newAngle:Float = 0;
		if (up)
		{
			newAngle = -90;
			if (left)
			{
				newAngle -= 45;
				// facing = FlxObject.LEFT;
			}
			else if (right)
			{
				newAngle += 45;
				// facing = FlxObject.RIGHT;
			}
		}
		else if (down)
		{
			newAngle = 90;
			if (left)
			{
				newAngle += 45;
				// facing = FlxObject.LEFT;
			}
			else if (right)
			{
				newAngle -= 45;
				// facing = FlxObject.RIGHT;
			}
		}
		else if (left)
		{
			newAngle = 180;
			// facing = FlxObject.LEFT;
		}
		else if (right)
		{
			newAngle = 0;
			// facing = FlxObject.RIGHT;
		}

		if (up || down || right || left)
		{
			velocity.set(SPEED, 0);
			velocity.rotate(FlxPoint.weak(0, 0), newAngle);
			if (!currentStepSound.playing)
			{
				currentStepSound = FlxG.sound.play(stepSounds[getRandomStepSound()]);
			}
			currentStepSound.proximity(x, y, PlayState.audioListener, 270, true);
			currentStepSound.volume = 0.35;
		}

		if (gun.angle > 0)
		{
			remove(body);
			insert(1, body);
		}
		else
		{
			remove(gun);
			insert(1, gun);
		}

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
