package;

#if windows
import faxe.Faxe;
#end
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.system.FlxAssets;
import flixel.system.FlxSound;
import openfl.display.Sprite;

class Main extends Sprite
{
	public static var currentLevel:Int = 1;
	public static var lastLevel:Int = 4;
	public static var lives:Int = 3;
	public static var series32:FlxBitmapFont;
	public static var series18:FlxBitmapFont;
	public static var series12:FlxBitmapFont;
	public static var musicMenu:FlxSound = new FlxSound();

	public var time:Float = 0;

	public function new()
	{
		super();

		#if windows
		Faxe.fmod_init(36);
		Faxe.fmod_load_bank("assets/soundbanks/Desktop/Master.bank");
		Faxe.fmod_load_bank("assets/soundbanks/Desktop/Master.strings.bank");
		#end
		// Get and set an even parameter to change effect values
		// trace("Lowpass param defaults to: " + Faxe.fmod_get_event_param("song", "ActivateTrack2"));
		// trace("Setting it to 1");
		// Faxe.fmod_set_event_param("song", "ActivateTrack2", 1.0);

		// Bad little forever loop to pump FMOD commands
		/*
			while (true)
			{
				// trace("event:/testEvent is playing: " + Faxe.fmod_event_is_playing("event:/testEvent"));
				Faxe.fmod_update();
			}
		 */
		addChild(new FlxGame(320, 240, AndroidTest, 1, 60, 60, true, false));
	}
}
