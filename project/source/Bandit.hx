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

class BanditHitBox extends FlxSprite
{
	public var parent:Bandit;

	public function new(x:Float = 0, y:Float = 0, _parent:Bandit)
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

class Bandit extends FlxSpriteGroup
{
	static inline var SPEED:Float = 100;
	static inline var SHOOT_COOLDOWN_DURATION_MAX:Float = 60 * 3.85;
	static inline var SHOOT_COOLDOWN_DURATION_MIN:Float = 60 * 1;
	static inline var MOVE_COOLDOWN_DURATION_MAX:Float = 60 * 1;
	static inline var MOVE_COOLDOWN_DURATION_MIN:Float = 60 * 0.5;
	static inline var STOP_COOLDOWN_DURATION_MAX:Float = 60 * 1;
	static inline var STOP_COOLDOWN_DURATION_MIN:Float = 60 * 0.5;

	static var shootSounds:Array<String> = [
		"assets/sounds/Disparo Bandidos 1.wav",
		"assets/sounds/Disparo Bandidos 2.wav",
		"assets/sounds/Disparo Bandidos 3.wav",
	];

	static var hitSounds:Array<String> = ["assets/sounds/hit1.wav", "assets/sounds/hit2.wav",];

	static var deathSounds:Array<String>;

	var shadow:FlxSprite;

	var body:FlxSprite;
	var gun:FlxSprite;
	var shootCooldown:Float = Math.random() * (SHOOT_COOLDOWN_DURATION_MAX - SHOOT_COOLDOWN_DURATION_MIN) + SHOOT_COOLDOWN_DURATION_MIN;
	var moveDuration:Float = 0.0;
	var stopDuration:Float = 0.0;
	var moveDirection:Float = 0.0;

	public var hitBox:BanditHitBox;
	public var gotHit:Bool;
	public var traceText:String;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		gotHit = false;
		width = 12;
		height = 24;
		offset.x = 0; //-24;
		offset.y = 0; //-24;

		shadow = new FlxSprite(0, 0);
		shadow.loadGraphic("assets/images/banditshadow.png");
		shadow.setFacingFlip(FlxObject.LEFT, true, false);
		shadow.setFacingFlip(FlxObject.RIGHT, false, false);
		shadow.width = 24;
		shadow.height = 24;
		shadow.offset.x = 12; //-24;
		shadow.offset.y = 12; //-24;
		add(shadow);

		body = new FlxSprite(0, 0);
		body.loadGraphic("assets/images/banditstrip48.png", true, 48, 48);
		body.setFacingFlip(FlxObject.LEFT, true, false);
		body.setFacingFlip(FlxObject.RIGHT, false, false);

		body.animation.add("walk", [2, 3, 4, 5], 10, true);
		body.animation.add("idle", [0, 1], 5, true);
		body.animation.add("corpse", [6], 10, true);
		body.animation.add("hurt", [7], 10, false);
		body.animation.play("idle");
		body.width = 24;
		body.height = 24;
		body.offset.x = 12; //-24;
		body.offset.y = 12; //-24;

		add(body);

		gun = new FlxSprite(0, 0);
		gun.loadGraphic("assets/images/gun.png", false, 48, 48);
		gun.setFacingFlip(FlxObject.LEFT, true, false);
		gun.setFacingFlip(FlxObject.RIGHT, false, false);

		gun.width = 24;
		gun.height = 24;
		gun.offset.x = 12; //-24;
		gun.offset.y = 12; //-24;
		add(gun);

		hitBox = new BanditHitBox(0, 0, this);
		add(hitBox);

		drag.x = drag.y = 1600;

		deathSounds = [for (i in 1...60) 'assets/sounds/muerte_bandido_' + i + '.wav'];
	}

	override function update(elapsed:Float)
	{
		if (hitBox.alive && !PlayState.game.stagePaused)
		{
			shootCooldown--;
			moveDuration--;
			stopDuration--;
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
		body.animation.play("hurt");
		var _randomSound:Int = Math.round((deathSounds.length - 1) * Math.random());
		var _chosenSound:String = deathSounds[_randomSound];
		var _sound = FlxG.sound.play(_chosenSound);
		_sound.proximity(x, y, PlayState.audioListener, 270, true);
		_sound.volume = 0.4;
		var _randomSound2:Int = Math.round(Math.random());
		var _chosenSound2:String = hitSounds[_randomSound2];
		var _sound2 = FlxG.sound.play(_chosenSound2);
		_sound2.proximity(x, y, PlayState.audioListener, 270, true);
	}

	function updateMovement()
	{
		var heroDirection = FlxAngle.angleBetween(this.body, PlayState.game.hero.body, true);
		gun.angle = heroDirection;
		if (Math.abs(heroDirection) >= 90)
			facing = FlxObject.LEFT;
		else
			facing = FlxObject.RIGHT;
		if (facing == FlxObject.LEFT)
		{
			gun.angle += 180;
		}
		var gunAngleRadians = Math.PI / 180 * heroDirection;
		if (shootCooldown < 0)
		{
			// FlxG.camera.shake(0.005, 0.1);
			var _randomSound:Int = Math.round((shootSounds.length - 1) * Math.random());
			var _chosenSound:String = shootSounds[_randomSound];
			var _sound = FlxG.sound.play(_chosenSound);
			_sound.proximity(x, y, PlayState.audioListener, 270, true);
			gunAngleRadians = Math.PI / 180 * (heroDirection + (0.5 - Math.random()) * 35);
			var gunPoint:FlxPoint = FlxPoint.weak(x - offset.x + 22 * Math.cos(gunAngleRadians), y - offset.y + 22 * Math.sin(gunAngleRadians));
			PlayState.game.spawnBullet(gunPoint.x, gunPoint.y, heroDirection, "BANDIT");
			shootCooldown = Math.random() * (SHOOT_COOLDOWN_DURATION_MAX - SHOOT_COOLDOWN_DURATION_MIN) + SHOOT_COOLDOWN_DURATION_MIN;
		}
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		/*
			up = FlxG.keys.anyPressed([UP, W]);
			down = FlxG.keys.anyPressed([DOWN, S]);
			left = FlxG.keys.anyPressed([LEFT, A]);
			right = FlxG.keys.anyPressed([RIGHT, D]);
		 */

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
			}
			else if (right)
			{
				newAngle += 45;
			}
		}
		else if (down)
		{
			newAngle = 90;
			if (left)
			{
				newAngle += 45;
			}
			else if (right)
			{
				newAngle -= 45;
			}
		}
		else if (left)
		{
			newAngle = 180;
		}
		else if (right)
		{
			newAngle = 0;
		}

		if (stopDuration < 0)
		{
			if (moveDuration < 0)
			{
				moveDuration = Math.random() * (MOVE_COOLDOWN_DURATION_MAX - MOVE_COOLDOWN_DURATION_MIN) + MOVE_COOLDOWN_DURATION_MIN;
				moveDirection = Math.random() * 360;
			}
			velocity.set(SPEED, 0);
			velocity.rotate(FlxPoint.weak(0, 0), moveDirection);
		}
		else if (moveDuration < 0)
		{
			stopDuration = Math.random() * (STOP_COOLDOWN_DURATION_MAX - STOP_COOLDOWN_DURATION_MIN) + STOP_COOLDOWN_DURATION_MIN;
			velocity.set(0);
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
