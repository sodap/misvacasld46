package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y27:assets%2Fdata%2Flevel0.jsonR2i1068R3R4R5R7R6tgoR0y27:assets%2Fdata%2Flevel1.jsonR2i1066R3R4R5R8R6tgoR0y28:assets%2Fdata%2Flevel1b.jsonR2i960R3R4R5R9R6tgoR0y27:assets%2Fdata%2Flevel2.jsonR2i1277R3R4R5R10R6tgoR0y29:assets%2Fdata%2FmisVacas.ogmoR2i3361R3R4R5R11R6tgoR0y34:assets%2Fimages%2Fbanditshadow.pngR2i3485R3y5:IMAGER5R12R6tgoR0y35:assets%2Fimages%2Fbanditstrip48.pngR2i5728R3R13R5R14R6tgoR0y28:assets%2Fimages%2Fbullet.pngR2i3490R3R13R5R15R6tgoR0y35:assets%2Fimages%2Fbulletstrip24.pngR2i3594R3R13R5R16R6tgoR0y31:assets%2Fimages%2Fcowcorpse.pngR2i3829R3R13R5R17R6tgoR0y31:assets%2Fimages%2Fcowshadow.pngR2i3486R3R13R5R18R6tgoR0y32:assets%2Fimages%2Fcowstrip48.pngR2i5562R3R13R5R19R6tgoR0y30:assets%2Fimages%2Femptycow.pngR2i3513R3R13R5R20R6tgoR0y28:assets%2Fimages%2Fending.pngR2i4710R3R13R5R21R6tgoR0y26:assets%2Fimages%2Fgame.pngR2i6178R3R13R5R22R6tgoR0y30:assets%2Fimages%2Fgameover.pngR2i6702R3R13R5R23R6tgoR0y25:assets%2Fimages%2Fgun.pngR2i3573R3R13R5R24R6tgoR0y32:assets%2Fimages%2Fgunstrip48.pngR2i4122R3R13R5R25R6tgoR0y32:assets%2Fimages%2Fheroshadow.pngR2i3534R3R13R5R26R6tgoR0y33:assets%2Fimages%2Fherostrip48.pngR2i5680R3R13R5R27R6tgoR0y31:assets%2Fimages%2Fhowtoplay.pngR2i9313R3R13R5R28R6tgoR0y33:assets%2Fimages%2Fmousecursor.pngR2i3618R3R13R5R29R6tgoR0y27:assets%2Fimages%2Ftitle.pngR2i9306R3R13R5R30R6tgoR0y25:assets%2Fimages%2Fwin.pngR2i7329R3R13R5R31R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R32R6tgoR2i29444R3y5:SOUNDR5y44:assets%2Fsounds%2FDisparo%20Bandidos%201.wavy9:pathGroupaR34hR6tgoR2i29444R3R33R5y44:assets%2Fsounds%2FDisparo%20Bandidos%202.wavR35aR36hR6tgoR2i29444R3R33R5y44:assets%2Fsounds%2FDisparo%20Bandidos%203.wavR35aR37hR6tgoR2i30926R3R33R5y38:assets%2Fsounds%2Fmuerte_bandido_1.wavR35aR38hR6tgoR2i36910R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_10.wavR35aR39hR6tgoR2i36326R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_11.wavR35aR40hR6tgoR2i36024R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_12.wavR35aR41hR6tgoR2i59348R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_13.wavR35aR42hR6tgoR2i45576R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_14.wavR35aR43hR6tgoR2i50424R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_15.wavR35aR44hR6tgoR2i47812R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_16.wavR35aR45hR6tgoR2i35402R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_17.wavR35aR46hR6tgoR2i19648R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_18.wavR35aR47hR6tgoR2i20782R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_19.wavR35aR48hR6tgoR2i34886R3R33R5y38:assets%2Fsounds%2Fmuerte_bandido_2.wavR35aR49hR6tgoR2i18384R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_20.wavR35aR50hR6tgoR2i28664R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_21.wavR35aR51hR6tgoR2i14650R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_22.wavR35aR52hR6tgoR2i15630R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_23.wavR35aR53hR6tgoR2i26478R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_24.wavR35aR54hR6tgoR2i26924R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_25.wavR35aR55hR6tgoR2i27456R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_26.wavR35aR56hR6tgoR2i16166R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_27.wavR35aR57hR6tgoR2i25130R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_28.wavR35aR58hR6tgoR2i32964R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_29.wavR35aR59hR6tgoR2i36548R3R33R5y38:assets%2Fsounds%2Fmuerte_bandido_3.wavR35aR60hR6tgoR2i30590R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_30.wavR35aR61hR6tgoR2i47650R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_31.wavR35aR62hR6tgoR2i37842R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_32.wavR35aR63hR6tgoR2i27440R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_33.wavR35aR64hR6tgoR2i26560R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_34.wavR35aR65hR6tgoR2i24600R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_35.wavR35aR66hR6tgoR2i21646R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_36.wavR35aR67hR6tgoR2i19586R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_37.wavR35aR68hR6tgoR2i28462R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_38.wavR35aR69hR6tgoR2i23300R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_39.wavR35aR70hR6tgoR2i28296R3R33R5y38:assets%2Fsounds%2Fmuerte_bandido_4.wavR35aR71hR6tgoR2i28224R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_40.wavR35aR72hR6tgoR2i19868R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_41.wavR35aR73hR6tgoR2i13182R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_42.wavR35aR74hR6tgoR2i19458R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_43.wavR35aR75hR6tgoR2i20480R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_44.wavR35aR76hR6tgoR2i27992R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_45.wavR35aR77hR6tgoR2i15812R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_46.wavR35aR78hR6tgoR2i18918R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_47.wavR35aR79hR6tgoR2i20192R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_48.wavR35aR80hR6tgoR2i21120R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_49.wavR35aR81hR6tgoR2i30998R3R33R5y38:assets%2Fsounds%2Fmuerte_bandido_5.wavR35aR82hR6tgoR2i18896R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_50.wavR35aR83hR6tgoR2i21558R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_51.wavR35aR84hR6tgoR2i17090R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_52.wavR35aR85hR6tgoR2i13138R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_53.wavR35aR86hR6tgoR2i15438R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_54.wavR35aR87hR6tgoR2i19432R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_55.wavR35aR88hR6tgoR2i25912R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_56.wavR35aR89hR6tgoR2i53486R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_57.wavR35aR90hR6tgoR2i40602R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_58.wavR35aR91hR6tgoR2i25302R3R33R5y39:assets%2Fsounds%2Fmuerte_bandido_59.wavR35aR92hR6tgoR2i24806R3R33R5y38:assets%2Fsounds%2Fmuerte_bandido_6.wavR35aR93hR6tgoR2i20550R3R33R5y38:assets%2Fsounds%2Fmuerte_bandido_7.wavR35aR94hR6tgoR2i20398R3R33R5y38:assets%2Fsounds%2Fmuerte_bandido_8.wavR35aR95hR6tgoR2i19876R3R33R5y38:assets%2Fsounds%2Fmuerte_bandido_9.wavR35aR96hR6tgoR2i160846R3R33R5y36:assets%2Fsounds%2Fmuerte_larga_1.wavR35aR97hR6tgoR2i30774R3R33R5y35:assets%2Fsounds%2Fmuerte_vaca_1.wavR35aR98hR6tgoR2i74302R3R33R5y35:assets%2Fsounds%2Fmuerte_vaca_2.wavR35aR99hR6tgoR2i93002R3R33R5y35:assets%2Fsounds%2Fmuerte_vaca_3.wavR35aR100hR6tgoR2i51234R3R33R5y35:assets%2Fsounds%2Fmuerte_vaca_4.wavR35aR101hR6tgoR2i61372R3R33R5y35:assets%2Fsounds%2Fmuerte_vaca_5.wavR35aR102hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R103R6tgoR2i62702R3R33R5y28:assets%2Fsounds%2Fvaca_1.wavR35aR104hR6tgoR2i55886R3R33R5y28:assets%2Fsounds%2Fvaca_2.wavR35aR105hR6tgoR2i94080R3R33R5y28:assets%2Fsounds%2Fvaca_3.wavR35aR106hR6tgoR2i57056R3R33R5y28:assets%2Fsounds%2Fvaca_4.wavR35aR107hR6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3R35aR109y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R108R5y28:flixel%2Fsounds%2Fflixel.mp3R35aR111y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R33R5R110R35aR109R110hgoR2i33629R3R33R5R112R35aR111R112hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R113R114y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R13R5R119R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R13R5R120R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level0_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level1_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level1b_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level2_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_misvacas_ogmo extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_banditshadow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_banditstrip48_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bulletstrip24_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cowcorpse_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cowshadow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cowstrip48_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_emptycow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ending_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_game_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gun_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gunstrip48_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_heroshadow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_herostrip48_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_howtoplay_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mousecursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_win_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_bandidos_1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_bandidos_2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_bandidos_3_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_10_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_11_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_12_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_13_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_14_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_15_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_16_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_17_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_18_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_19_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_20_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_21_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_22_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_23_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_24_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_25_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_26_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_27_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_28_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_29_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_3_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_30_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_31_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_32_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_33_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_34_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_35_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_36_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_37_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_38_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_39_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_4_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_40_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_41_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_42_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_43_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_44_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_45_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_46_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_47_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_48_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_49_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_5_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_50_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_51_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_52_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_53_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_54_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_55_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_56_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_57_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_58_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_59_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_6_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_7_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_8_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_9_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_larga_1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_3_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_4_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_5_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_1_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_2_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_3_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_4_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/level0.json") @:noCompletion #if display private #end class __ASSET__assets_data_level0_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level1.json") @:noCompletion #if display private #end class __ASSET__assets_data_level1_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level1b.json") @:noCompletion #if display private #end class __ASSET__assets_data_level1b_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/level2.json") @:noCompletion #if display private #end class __ASSET__assets_data_level2_json extends haxe.io.Bytes {}
@:keep @:file("assets/data/misVacas.ogmo") @:noCompletion #if display private #end class __ASSET__assets_data_misvacas_ogmo extends haxe.io.Bytes {}
@:keep @:image("assets/images/banditshadow.png") @:noCompletion #if display private #end class __ASSET__assets_images_banditshadow_png extends lime.graphics.Image {}
@:keep @:image("assets/images/banditstrip48.png") @:noCompletion #if display private #end class __ASSET__assets_images_banditstrip48_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bullet.png") @:noCompletion #if display private #end class __ASSET__assets_images_bullet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bulletstrip24.png") @:noCompletion #if display private #end class __ASSET__assets_images_bulletstrip24_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cowcorpse.png") @:noCompletion #if display private #end class __ASSET__assets_images_cowcorpse_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cowshadow.png") @:noCompletion #if display private #end class __ASSET__assets_images_cowshadow_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cowstrip48.png") @:noCompletion #if display private #end class __ASSET__assets_images_cowstrip48_png extends lime.graphics.Image {}
@:keep @:image("assets/images/emptycow.png") @:noCompletion #if display private #end class __ASSET__assets_images_emptycow_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ending.png") @:noCompletion #if display private #end class __ASSET__assets_images_ending_png extends lime.graphics.Image {}
@:keep @:image("assets/images/game.png") @:noCompletion #if display private #end class __ASSET__assets_images_game_png extends lime.graphics.Image {}
@:keep @:image("assets/images/gameover.png") @:noCompletion #if display private #end class __ASSET__assets_images_gameover_png extends lime.graphics.Image {}
@:keep @:image("assets/images/gun.png") @:noCompletion #if display private #end class __ASSET__assets_images_gun_png extends lime.graphics.Image {}
@:keep @:image("assets/images/gunstrip48.png") @:noCompletion #if display private #end class __ASSET__assets_images_gunstrip48_png extends lime.graphics.Image {}
@:keep @:image("assets/images/heroshadow.png") @:noCompletion #if display private #end class __ASSET__assets_images_heroshadow_png extends lime.graphics.Image {}
@:keep @:image("assets/images/herostrip48.png") @:noCompletion #if display private #end class __ASSET__assets_images_herostrip48_png extends lime.graphics.Image {}
@:keep @:image("assets/images/howtoplay.png") @:noCompletion #if display private #end class __ASSET__assets_images_howtoplay_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mousecursor.png") @:noCompletion #if display private #end class __ASSET__assets_images_mousecursor_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends lime.graphics.Image {}
@:keep @:image("assets/images/win.png") @:noCompletion #if display private #end class __ASSET__assets_images_win_png extends lime.graphics.Image {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo Bandidos 1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_bandidos_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo Bandidos 2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_bandidos_2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Disparo Bandidos 3.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_disparo_bandidos_3_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_10.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_10_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_11.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_11_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_12.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_12_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_13.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_13_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_14.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_14_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_15.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_15_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_16.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_16_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_17.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_17_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_18.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_18_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_19.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_19_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_20.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_20_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_21.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_21_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_22.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_22_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_23.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_23_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_24.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_24_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_25.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_25_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_26.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_26_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_27.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_27_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_28.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_28_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_29.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_29_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_3.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_3_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_30.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_30_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_31.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_31_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_32.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_32_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_33.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_33_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_34.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_34_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_35.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_35_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_36.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_36_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_37.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_37_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_38.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_38_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_39.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_39_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_4.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_4_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_40.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_40_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_41.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_41_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_42.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_42_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_43.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_43_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_44.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_44_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_45.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_45_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_46.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_46_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_47.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_47_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_48.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_48_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_49.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_49_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_5.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_5_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_50.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_50_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_51.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_51_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_52.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_52_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_53.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_53_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_54.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_54_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_55.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_55_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_56.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_56_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_57.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_57_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_58.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_58_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_59.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_59_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_6.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_6_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_7.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_7_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_8.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_8_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_bandido_9.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_bandido_9_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_larga_1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_larga_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_vaca_1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_vaca_2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_vaca_3.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_3_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_vaca_4.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_4_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/muerte_vaca_5.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_muerte_vaca_5_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/vaca_1.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_1_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/vaca_2.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_2_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/vaca_3.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_3_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/vaca_4.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_vaca_4_wav extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,7,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,7,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,7,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,7,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,7,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,7,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
