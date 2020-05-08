package;

#if windows
import faxe.Faxe;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxAxes;
import flixel.util.FlxTimer;

class TitleState extends FlxState
{
	private var background:FlxSprite;

	public var time:Float = 0;
	public var timeStep:Float = 1;

	override public function create()
	{
		// FlxG.sound.playMusic("assets/music/Mis Vacas - Main.ogg");
		Main.currentLevel = 1;
		Main.lives = 3;
		super.create();

		var mouseSprite = new FlxSprite();
		mouseSprite.loadGraphic("assets/images/mousecursor.png");
		FlxG.mouse.load(mouseSprite.pixels, 3, -28, -28);

		background = new FlxSprite();
		background.loadGraphic(AssetPaths.title__png);
		background.loadGraphic("assets/images/titlestrip.png", true, 320, 240);
		background.animation.add("normal", [0, 1], 3.6, true);
		add(background);
		background.animation.play("normal");

		var playButton:FlxButton;
		playButton = new FlxButton(0, 190, "", clickPlay);
		playButton.loadGraphic("assets/images/startbutton76.png", true, 76, 40);
		playButton.screenCenter(FlxAxes.X);
		playButton.labelAlphas = [1, 1, 1];
		add(playButton);

		#if windows
		initSounds();
		#end
	}

	#if windows
	public function initSounds()
	{
		Faxe.fmod_load_event("event:/song", "ending");
		Faxe.fmod_play_event("ending");
	}
	#end

	public function updateReverb(_time:Float):Float
	{
		var totalTime = _time / 600;
		trace(totalTime);
		#if windows
		Faxe.fmod_set_event_param("ending", "testParameter", totalTime);
		#end
		if (_time >= 600)
			timeStep = -1;
		if (_time <= 0)
			timeStep = 1;
		return _time + timeStep;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		#if windows
		Faxe.fmod_update();
		#end
		time = updateReverb(time);
	}

	function clickPlay()
	{
		var startTimer = new FlxTimer();
		startTimer.start(0.3, startGame, 1);
		FlxG.sound.play("assets/sounds/Click1.wav");
	}

	function startGame(timer:FlxTimer)
	{
		FlxG.switchState(new HowToPlayState());
	}
}
