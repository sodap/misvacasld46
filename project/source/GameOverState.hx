package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;

class GameOverState extends FlxState
{
	var currentlevel = Main.currentLevel;

	override public function create()
	{
		super.create();

		var background = new FlxSprite();
		background.loadGraphic(AssetPaths.gameover__png);
		add(background);

		var startTimer = new FlxTimer();
		startTimer.start(8, exitToTitle, 1);
		/*
			var retryButton:FlxButton;
			retryButton = new FlxButton(0, 0, 'Retry Level $currentlevel', retry);
			add(retryButton);
			retryButton.screenCenter();
			retryButton.x -= 60;
			retryButton.y += 60;

			var titleButton:FlxButton;
			titleButton = new FlxButton(0, 0, "Exit to Title", exitToTitle);
			add(titleButton);
			titleButton.screenCenter();
			titleButton.x += 60;
			titleButton.y += 60;
		 */

		FlxG.sound.play("assets/sounds/Game Over 2.wav");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.justReleased)
		{
			FlxG.switchState(new TitleState());
		}
	}

	function retry()
	{
		FlxG.switchState(new PlayState());
	}

	function exitToTitle(timer:FlxTimer)
	{
		FlxG.switchState(new TitleState());
	}
}
