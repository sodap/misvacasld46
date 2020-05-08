package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxBackdrop;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.text.FlxBitmapText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class EndingState extends FlxState
{
	var whiteColor:FlxColor = 0xFFede1bb;
	var brownColor:FlxColor = 0xFF853f00;
	var yellowColor:FlxColor = 0xFFcda540;
	var greenColor:FlxColor = 0xFF697152;

	var background:FlxBackdrop;
	var hero:EndingHero;
	var storyStep:Int = 0;
	var storyString:Array<String> = [
		"The story reached everywhere,",
		"and the cowboy became a legend.",
		"No outlaw ever dared\nto confront him",
		"while he traveled across\nthe country with the cows.",
		" ",
		"He and his homies were\npreparing some big-ass bbq.",
		" ",
	];
	var storyTime:Array<Int> = [3, 4, 4, 5, 1, 6, 1];

	var storyText:FlxBitmapText;

	override public function create()
	{
		FlxG.sound.playMusic("assets/music/Mis Vacas - Final.ogg");
		FlxG.sound.music.fadeIn(2);
		super.create();
		Main.series32 = FlxBitmapFont.fromAngelCode("assets/fonts/series32_0.png", "assets/fonts/series32.fnt");
		Main.series12 = FlxBitmapFont.fromAngelCode("assets/fonts/series12_0.png", "assets/fonts/series12.fnt");

		var background = new FlxBackdrop("assets/images/game.png", 1, 0, true, false, 0, 0);
		add(background);

		for (i in 0...4)
		{
			var cow = new EndingCow(50 - 48 * (i + 1), 220);
			add(cow);
		}

		hero = new EndingHero(50, 222);
		add(hero);

		FlxG.camera.follow(hero);

		var overlay = new FlxBackdrop("assets/images/ending.png", 0, 0, false, false, 0, 0);
		add(overlay);

		var startTimer = new FlxTimer();
		startTimer.start(1, addStoryText, 1);
	}

	function addStoryText(timer:FlxTimer)
	{
		timer.destroy();
		remove(storyText);
		storyText = new FlxBitmapText(Main.series12); // (0, 0, 0, _text, 24);
		storyText.text = storyString[storyStep];
		storyStep++;
		storyText.textColor = whiteColor;
		storyText.letterSpacing = 1;
		storyText.setSize(160, 80);
		storyText.alignment = FlxTextAlign.CENTER;
		storyText.screenCenter();
		storyText.y += 86;
		storyText.scrollFactor.set(0, 0);
		// missionText = new FlxText(0, 0, 0, 'Protect the cows!', 10);
		add(storyText);
		if (storyStep < storyString.length)
		{
			var startTimer = new FlxTimer();
			startTimer.start(storyTime[storyStep - 1], addStoryText, 1);
		}
		else
		{
			var startTimer = new FlxTimer();
			startTimer.start(1, addEndText, 1);
		}
	}

	function addEndText(timer:FlxTimer)
	{
		FlxG.sound.music.fadeOut(9);
		timer.destroy();
		remove(storyText);
		storyText = new FlxBitmapText(Main.series32);
		storyText.setBorderStyle(FlxTextBorderStyle.OUTLINE, brownColor, 2, 4);
		storyText.text = "FIN";
		storyText.textColor = whiteColor;
		storyText.letterSpacing = 1;
		storyText.setSize(160, 80);
		storyText.alignment = FlxTextAlign.CENTER;
		storyText.screenCenter();
		storyText.scrollFactor.set(0, 0);
		add(storyText);
		var startTimer = new FlxTimer();
		startTimer.start(10, exitToTitle, 1);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function exitToTitle(timer:FlxTimer)
	{
		FlxG.switchState(new TitleState());
	}
}
