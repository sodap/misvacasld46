package;

import Bandit.BanditHitBox;
import Cow.CowHitBox;
import Hero.HeroHitBox;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.addons.weapon.FlxBullet;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.system.replay.CodeValuePair;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import flixel.text.FlxBitmapText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxTimer;
import openfl.text.AntiAliasType;

class PlayState extends FlxState
{
	public static var game:PlayState;
	public static var audioListener:FlxObject;

	var level:FlxOgmo3Loader;

	public var hero:Hero;
	public var cows:FlxTypedGroup<CowHitBox>;
	public var bandits:FlxTypedGroup<BanditHitBox>;
	public var bullets:FlxTypedGroup<Bullet>;
	public var heroHitBox:HeroHitBox;
	public var cowsAlive:Int = 0;
	public var totalCows:Int = 0;
	public var banditsAlive:Int = 0;

	public var winTimerDuration:Int = 60 * 2;
	public var winTimer:Int = -1;

	public var stagePaused:Bool = true;

	public var loseTimer:Int = -1;

	public static var loseTimerDuration:Int = 60 * 2;

	static var levelList:Array<String> = [
		"assets/data/level0.json",
		"assets/data/level1.json",
		"assets/data/level2.json",
		"assets/data/level3.json",
		"assets/data/level4.json",
		"assets/data/level5.json",
		"assets/data/level6.json",
		"assets/data/level7.json"
	];

	var entities:FlxTypedGroup<FlxSprite>;
	var startText:FlxBitmapText;
	var missionText:FlxBitmapText;
	var perfectText:FlxBitmapText;
	var completeTimer:FlxTimer;
	var failTimer:FlxTimer;
	var livesText:FlxBitmapText;
	var whiteColor:FlxColor = 0xFFede1bb; // 0xFF697152;
	var brownColor:FlxColor = 0xFF853f00; // 0xFF853f00;
	var yellowColor:FlxColor = 0xFFcda540;
	var greenColor:FlxColor = 0xFF697152;

	override public function create()
	{
		// FlxG.sound.music.fadeOut(3);
		Main.series32 = FlxBitmapFont.fromAngelCode("assets/fonts/series32_0.png", "assets/fonts/series32.fnt");
		Main.series18 = FlxBitmapFont.fromAngelCode("assets/fonts/series18_0.png", "assets/fonts/series18.fnt");
		Main.series12 = FlxBitmapFont.fromAngelCode("assets/fonts/series12_0.png", "assets/fonts/series12.fnt");
		super.create();
		game = this;
		audioListener = new FlxObject(160, 120);
		add(audioListener);
		entities = new FlxTypedGroup<FlxSprite>();
		var background = new FlxSprite(-5, 5);
		background.loadGraphic("assets/images/game.png");
		add(background);
		bgColor = FlxColor.fromString("#cda540");
		level = new FlxOgmo3Loader("assets/data/misVacas.ogmo", levelList[Main.currentLevel - 1]);
		hero = new Hero();
		cows = new FlxTypedGroup<CowHitBox>();
		totalCows = 0;
		bandits = new FlxTypedGroup<BanditHitBox>();
		banditsAlive = 0;
		bullets = new FlxTypedGroup<Bullet>();
		level.loadEntities(placeEntities, "entities");
		totalCows = cowsAlive;
		entities.add(hero);
		add(entities);
		var livesHud = new FlxSprite(8, 8);
		livesHud.loadGraphic("assets/images/heroPortrait.png");
		add(livesHud);
		livesText = new FlxBitmapText(Main.series12); // 32, 8, 0, 'x' + Main.lives, 12);
		livesText.x = 32;
		livesText.y = 8;
		livesText.text = 'x' + Main.lives;
		livesText.letterSpacing = 1;
		livesText.setBorderStyle(FlxTextBorderStyle.OUTLINE, brownColor, 2);
		add(livesText);

		FlxG.worldBounds.set(0, 0, 320, 240);
		FlxG.scaleMode = new PixelPerfectScaleMode();

		var startTimer = new FlxTimer();
		startTimer.start(0.35, addStartText, 1);
		/*
			var winButton:FlxButton;
			winButton = new FlxButton(0, 0, "Stage Complete", stageComplete);
			add(winButton);
			winButton.screenCenter();
			winButton.x -= 60;

			var loseButton:FlxButton;
			loseButton = new FlxButton(0, 0, "Stage Lost", stageLost);
			add(loseButton);
			loseButton.screenCenter();
			loseButton.x += 60;
		 */
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		entities.sort(FlxSort.byY, FlxSort.ASCENDING);
		FlxG.overlap(bullets, cows, killCow);
		FlxG.overlap(bullets, bandits, killBandit);
		FlxG.overlap(bullets, bandits, killBandit);
		FlxG.overlap(bullets, heroHitBox, killHero);

		winTimer--;
		loseTimer--;
		if (winTimer == 0)
		{
			//
		}
		if (loseTimer == 0)
		{
			stageLost();
		}
	}

	function addStartText(timer:FlxTimer)
	{
		timer.destroy();
		var _text = 'STAGE ${Main.currentLevel}';
		if (Main.currentLevel == levelList.length)
		{
			_text = 'FINAL STAGE';
		}
		startText = new FlxBitmapText(Main.series32); // (0, 0, 0, _text, 24);
		startText.text = _text;
		startText.setBorderStyle(FlxTextBorderStyle.OUTLINE, brownColor, 2, 2);
		// startText.useTextColor = true;
		startText.textColor = FlxColor.WHITE;
		startText.color = FlxColor.WHITE;
		startText.screenCenter();
		startText.y -= 24;
		add(startText);
		var startTimer = new FlxTimer();
		startTimer.start(0.35, addMissionText, 1);
		FlxG.sound.play("assets/sounds/Letters.wav");
	}

	function addMissionText(timer:FlxTimer)
	{
		timer.destroy();
		missionText = new FlxBitmapText(Main.series12); // (0, 0, 0, _text, 24);
		missionText.text = 'Protect the cows!';
		missionText.textColor = whiteColor;
		missionText.letterSpacing = 1;
		// missionText.useTextColor = true;
		missionText.setBorderStyle(FlxTextBorderStyle.OUTLINE, brownColor, 2, 2);
		missionText.screenCenter();
		// startText.y -= 24;
		// missionText = new FlxText(0, 0, 0, 'Protect the cows!', 10);
		missionText.screenCenter();
		add(missionText);
		var startTimer = new FlxTimer();
		startTimer.start(1, startStage, 1);
		FlxG.sound.play("assets/sounds/Letters.wav");
	}

	function addStageFailedText(timer:FlxTimer)
	{
		timer.destroy();
		startText = new FlxBitmapText(Main.series32); // (0, 0, 0, _text, 24);
		startText.text = 'DEFEAT';
		startText.textColor = whiteColor;
		startText.setBorderStyle(FlxTextBorderStyle.OUTLINE, brownColor, 2, 2);
		// startText.useTextColor = true;
		startText.screenCenter();
		startText.y -= 24;
		stagePaused = true;
		add(startText);
		var startTimer = new FlxTimer();
		startTimer.start(0.35, addDefeatReasonText, 1);
		FlxG.sound.play("assets/sounds/Game Over 1.wav");
	}

	function addDefeatReasonText(timer:FlxTimer)
	{
		timer.destroy();
		missionText = new FlxBitmapText(Main.series12); // (0, 0, 0, _text, 24);
		missionText.text = 'Killed by a bandit!';
		missionText.textColor = whiteColor;
		missionText.letterSpacing = 1;
		// missionText.useTextColor = true;
		missionText.setBorderStyle(FlxTextBorderStyle.OUTLINE, brownColor, 2, 2);
		missionText.screenCenter();
		if (cowsAlive <= 0)
		{
			missionText.text = 'All cows were killed';
		}
		add(missionText);
		var startTimer = new FlxTimer();
		startTimer.start(1, addRetryButton, 1);
		// FlxG.sound.play("assets/sounds/Letters.wav");
	}

	function addRetryButton(timer:FlxTimer)
	{
		if (Main.lives > 0)
		{
			var retryButton:FlxButton;
			retryButton = new FlxButton(0, 190, '', retry);
			add(retryButton);
			retryButton.loadGraphic("assets/images/tryagain125.png", true, 125, 40);
			retryButton.screenCenter();
			retryButton.y += 60;
		}
		else
		{
			FlxG.switchState(new GameOverState());
		}
	}

	function retry()
	{
		FlxG.sound.play("assets/sounds/Click1.wav");
		var startTimer = new FlxTimer();
		startTimer.start(0.4, doRetry, 1);
	}

	function doRetry(timer:FlxTimer)
	{
		FlxG.switchState(new PlayState());
	}

	function addStageCompleteText(timer:FlxTimer)
	{
		timer.destroy();
		startText = new FlxBitmapText(Main.series32); // (0, 0, 0, _text, 24);
		startText.text = 'VICTORY';
		startText.textColor = whiteColor;
		startText.setBorderStyle(FlxTextBorderStyle.OUTLINE, brownColor, 2, 4);
		startText.screenCenter();
		// startText.useTextColor = true;
		startText.y -= 24;
		hero.body.animation.play("idle");
		stagePaused = true;
		add(startText);
		var startTimer = new FlxTimer();
		startTimer.start(0.35, addCowsSavedText, 1);
		FlxG.sound.play("assets/sounds/Complete 1.wav");
	}

	function addCowsSavedText(timer:FlxTimer)
	{
		timer.destroy();
		missionText = new FlxBitmapText(Main.series12); // (0, 0, 0, _text, 24);
		missionText.text = 'You saved $cowsAlive cows';
		if (cowsAlive == 1)
			missionText.text = 'You saved one cow';
		missionText.textColor = whiteColor;
		missionText.letterSpacing = 1;
		// missionText.useTextColor = true;
		missionText.setBorderStyle(FlxTextBorderStyle.OUTLINE, brownColor, 2, 4);
		missionText.screenCenter();
		add(missionText);
		var startTimer = new FlxTimer();
		if (cowsAlive == totalCows)
		{
			startTimer.start(0.6, addPerfectText, 1);
			livesText.text = 'x' + Main.lives;
		}
		else
		{
			startTimer.start(1, endStage, 1);
		}
		//	FlxG.sound.play("assets/sounds/Letters.wav");
	}

	function addPerfectText(timer:FlxTimer)
	{
		Main.lives++;
		livesText.text = 'x' + Main.lives;
		timer.destroy();
		perfectText = new FlxBitmapText(Main.series12); // (0, 0, 0, _text, 24);
		perfectText.text = 'PERFECT!';
		perfectText.letterSpacing = 2;
		perfectText.setBorderStyle(FlxTextBorderStyle.OUTLINE, greenColor, 2, 2);
		perfectText.screenCenter();
		perfectText.textColor = FlxColor.WHITE; // whiteColor;
		// perfectText.useTextColor = true;
		perfectText.color = FlxColor.WHITE;
		perfectText.y += 18;
		add(perfectText);
		var startTimer = new FlxTimer();
		startTimer.start(1, endStage, 1);
		FlxG.sound.play("assets/sounds/Perfect.wav"); // vaca_1
	}

	function endStage(timer:FlxTimer)
	{
		stageComplete();
	}

	function startStage(timer:FlxTimer)
	{
		stagePaused = false;
		timer.destroy();
		remove(startText);
		remove(missionText);
	}

	function freezeFrames(_time:Int)
	{
		FlxG.state.active = false;
		haxe.Timer.delay(restoreTime, _time);
	}

	function restoreTime()
	{
		FlxG.state.active = true;
	}

	function addBlood(bullet:Bullet, victim:FlxSprite)
	{
		var _facing = FlxObject.RIGHT;
		if (bullet.x > victim.x)
			_facing = FlxObject.LEFT;
		var _blood = new Blood(victim.x + Math.random() * victim.width, victim.y + Math.random() * victim.height, _facing);
		add(_blood);
	}

	function killHero(bullet:Bullet, _hero:HeroHitBox)
	{
		if (bullet.faction != "HERO")
		{
			if (bullet.alive)
			{
				_hero.parent.getHit();
				_hero.kill();
				if (completeTimer != null)
				{
					completeTimer.cancel();
				}
				failTimer = new FlxTimer();
				failTimer.start(0.75, addStageFailedText, 1);
				FlxG.camera.shake(0.01, 0.2);
				addBlood(bullet, hero);
				if (Main.lives > 0)
					Main.lives--;
				livesText.text = 'x' + Main.lives;
			}
			bullet.kill();
		}
	}

	function killBandit(bullet:Bullet, bandit:BanditHitBox)
	{
		if (bullet.faction != "BANDIT")
		{
			if (bullet.alive)
			{
				bandit.parent.getHit();
				addBlood(bullet, bandit);
				bandit.kill();
				freezeFrames(50);
				banditsAlive--;
			}
			bullet.kill();
			if (banditsAlive <= 0)
			{
				if (failTimer == null)
				{
					completeTimer = new FlxTimer();
					completeTimer.start(0.75, addStageCompleteText, 1);
				}
				// winTimer = winTimerDuration;
			}
		}
	}

	function killCow(bullet:Bullet, cow:CowHitBox)
	{
		if (bullet.alive)
		{
			cow.parent.getHit();
			addBlood(bullet, cow);
			cow.kill();
			freezeFrames(50);
			cowsAlive--;
		}
		cow.kill();
		bullet.kill();
		if (cowsAlive <= 0)
		{
			if (completeTimer != null)
			{
				completeTimer.cancel();
			}

			failTimer = new FlxTimer();
			failTimer.start(0.75, addStageFailedText, 1);
			if (Main.lives > 0)
				Main.lives--;
			livesText.text = 'x' + Main.lives;

			loseTimer = loseTimerDuration;
			winTimer = loseTimerDuration * 2;
		}
	}

	function stageComplete()
	{
		Main.currentLevel++;
		if (Main.currentLevel > levelList.length)
		{
			FlxG.switchState(new EndingState());
		}
		else
		{
			FlxG.switchState(new PlayState());
		}
	}

	public function stageLost()
	{
		//	FlxG.switchState(new GameOverState());
	}

	public function spawnBullet(x:Float = 0, y:Float = 0, direction:Float = 0, _faction:String)
	{
		var newBullet:Bullet = new Bullet(x, y, direction);
		add(newBullet);
		bullets.add(newBullet);
		newBullet.faction = _faction;
		newBullet.animation.play(_faction);
	}

	function placeEntities(entity:EntityData)
	{
		if (entity.name == "hero")
		{
			hero.setPosition(entity.x, entity.y);
			heroHitBox = hero.hitBox;
		}

		if (entity.name == "cow")
		{
			var newCow:Cow = new Cow(entity.x, entity.y);
			entities.add(newCow);
			cows.add(newCow.hitBox);
			cowsAlive++;
		}

		if (entity.name == "bandit")
		{
			var newBandit:Bandit = new Bandit(entity.x, entity.y);
			entities.add(newBandit);
			bandits.add(newBandit.hitBox);
			banditsAlive++;
		}
	}
}
