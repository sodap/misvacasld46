package;

import PlayState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxAxes;
import flixel.util.FlxTimer;
#if windows
import faxe.Faxe;
#end

class HowToPlayState extends FlxState
{
	override public function create()
	{
		super.create();

		var background = new FlxSprite();
		background.loadGraphic(AssetPaths.title__png);
		background.loadGraphic("assets/images/howtoplaystrip.png", true, 320, 240);
		background.animation.add("normal", [0, 1], 3.6, true);
		add(background);
		background.animation.play("normal");

		var playButton:FlxButton;
		playButton = new FlxButton(0, 196, "", clickPlay);
		playButton.loadGraphic("assets/images/letsgobutton107.png", true, 109, 40);
		playButton.screenCenter(FlxAxes.X);
		playButton.x += 88;
		playButton.labelAlphas = [1, 1, 1];
		add(playButton);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function clickPlay()
	{
		var startTimer = new FlxTimer();
		startTimer.start(0.3, startGame, 1);
		#if windows
		Faxe.fmod_stop_event("ending", true);
		#end
		// FlxG.sound.play("assets/sounds/Click2.wav");
	}

	function startGame(timer:FlxTimer)
	{
		FlxG.switchState(new PlayState());
	}
}
